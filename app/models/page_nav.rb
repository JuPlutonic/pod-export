# frozen_string_literal: true

require 'memoist'

# :reek:InstanceVariableAssumption
class PageNav
  RECORDS_PER_PAGE_ON_TARGETED_SITE = 20
  USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 ' \
               '(KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36'
  RETRIES = 5

  include ActiveModel::Model

  attr_reader :last_page, :page

  def initialize(first_page)
    @page = extract_page_from_raw_params(first_page)

    # Runs the scrapping with Nokogiri
    @last_page = scrape_last_page
    scrape_when_initialized
  end

  # ---------------ivars with parsed content------------------------------------
  def pod_organizations
    @pod_organizations = instance_variable_get(:@pod_organizations) || []
  end

  def tpis
    @tpis = instance_variable_get(:@tpis) || []
  end

  def add_pod_organizations(organization)
    pod_organizations << organization if organization.present?
  end

  def add_tpis(tpi)
    tpis << tpi if tpi.present?
  end
  # ----------------------------------------------------------------------------

  # ---------------SimpleForm methods-(include ActiveModel::Model)--------------
  def to_model
    self
  end

  def to_key
    [0..last_page]
  end

  def persisted?
    false
  end
  # ----------------------------------------------------------------------------

  # ---------------Filter implementation template.------------------------------
  #   It sends post-query to URI. Here scrape updates variables
  # def filter(keyword)
  #   get('/search', query: { q: keyword })['pods']
  #   doc = call_nokogiri_default_page_with_filter
  #   @last_page = scrape_last_page(doc)
  #   scrape(doc)
  # end
  # ----------------------------------------------------------------------------

  private

  def extract_page_from_raw_params(parameter)
    parameter.is_a?(Integer) and return parameter

    parameter.fetch('page').to_i.pred
  end

  require 'http'
  require 'openssl'
  require 'proxy_fetcher'
  require 'timeout'
  extend Memoist

  #  --------------Implementation template which is collecting json data-sets---
  # def scrape_data(pod)
  #   call_nokogiri_selected_pod_page
  # end

  # def call_nokogiri_selected_pod_page; end
  # ----------------------------------------------------------------------------

  # -----To service_objects app/services, ivar to Redis-------------------------
  def proxy_mgr
    # ProxyFetcher.configure do |config|
    #   config.provider = %i[free_proxy_list_ssl xroxy proxy_list]
    #   config.proxy_validation_timeout = 1
    #   config.user_agent = USER_AGENT
    # end
    manager = ProxyFetcher::Manager.new(refresh: false, file: Rails.root.join('proxies.txt').to_s)
    Rails.logger.warn("PROXIES: #{manager.proxies.size}\n^^^^^^^^^^^^")

    manager
  end
  memoize :proxy_mgr

  def verificate_proxies
    @proxies = proxy_mgr.get!
    raise StandardError, 'Validation of proxies.txt – 0 working' if @proxies.blank?

    if @proxies.http?
      @prefix = 'http://'
    elsif @proxies.https?
      @prefix = 'https://'
    else
      verificate_proxies
    end
  end
  memoize :verificate_proxies

  def serialize_proxy
    ["#{@prefix}#{@proxies.instance_values['addr']}", @proxies.instance_values['port']]
  end
  # ----------------------------------------------------------------------------

  def prepare_ssl
    ctx = OpenSSL::SSL::SSLContext.new
    ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
    ctx
  end

  def call_nokogiri_default_page(cur_page = 0)
    base_url = 'https://data.gov.ru/organizations?field_organization_inn_value=' \
               '&title=' \
               '&field_organization_short_name_value=' \
               '&term_node_tid_depth=All' \
               "&page=#{cur_page}"
    retries = ENV.fetch('RETRIES') { RETRIES }.to_s

    begin
      verificate_proxies(true)
      parsed = HTTP.timeout(connect: 15, write: 2, read: 10)
                   .via(*serialize_proxy)
                   .get(base_url, ssl_context: prepare_ssl)
                   .encoding(Encoding::UTF_8)
    rescue Timeout::Error
      retries -= 1
      sleep(1)
      retries.zero? and raise

      retry
    end
    Nokogiri::HTML(parsed, nil, 'UTF-8')
  end
  memoize :call_nokogiri_default_page

  def scrape_last_page
    # When we start browsing from the first page, li[12] will be the last paginated table
    call_nokogiri_default_page
      .xpath('//div[3]/ul/li[12]/a')
      .to_s
      .gsub(/^.*=/, '') # Removes useful parts of url query
      .gsub(/\D/, '').to_i # Removes non digit parts of html tags
  end
  memoize :scrape_last_page

  def scrape_when_initialized
    doc = page.zero? ? call_nokogiri_default_page(page) : call_nokogiri_default_page(page, true)
    scrape(doc)
  end

  def scrape(doc)
    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      add_pod_organizations(anchor.text.strip)

      # `gsub` is doing deletion of /organization/. It remains only tax_payer_id
      add_tpis(anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2').to_s)
    end
  end
  memoize :scrape
end
