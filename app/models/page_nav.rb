# frozen_string_literal: true

# :reek:InstanceVariableAssumption
class PageNav
  RECORDS_PER_PAGE_ON_TARGETED_SITE = 20
  USER_AGENT =
    %[Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) \
      Chrome/101.0.4951.64 Safari/537.36]
  # %[Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) \
  #   Chrome/101.0.4951.64 Safari/537.36]
  READ_TIMEOUT = 30
  RETRIES = 2

  include ActiveModel::Model

  attr_reader :last_page, :page

  def initialize(first_page)
    # Runs the scrapping with Nokogiri
    @page = extract_page_from_raw_params(first_page)

    same_page?(@page)
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

  def add_tpi(tpi)
    tpis << tpi if tpi.present?
  end
  # ----------------------------------------------------------------------------

  # Pod_organizations and tpis are accessed by method 'scape'.
  # So if we don't changing page, but pushing 'Visit page' button
  #   we'll see no load. The button is on controllers/pods/index.html.slim page
  def same_page?(raw_page)
    return if @page == raw_page

    # Redo the scrapping, rememoize with true
    doc = call_nokogiri_default_page(raw_page, true)
    scrape(doc, true)
  end

  # ---------------SimpleForm methods-------------------------------------------
  def to_model
    self
  end

  def to_key
    [0..@last_page]
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

  # Argument: parameter => String, a single unnested parameter
  def extract_page_from_raw_params(parameter)
    nested_param = instance_values.fetch('page') { 0 } # = parameter[:page].pred
    nested_param.to_i || instance_values.fetch(parameter).to_i # parameter.to_i
  end

  require 'memoist'
  extend Memoist
  require 'open-uri'
  require 'timeout'

  #  --------------Implementation template which is collecting json data-sets---
  # def scrape_data(pod)
  #   call_nokogiri_selected_pod_page
  # end

  # def call_nokogiri_selected_pod_page; end
  # ----------------------------------------------------------------------------

  def call_nokogiri_default_page(cur_page = 0)
    base_url = 'https://data.gov.ru/organizations?field_organization_inn_value=' \
               '&title=' \
               '&field_organization_short_name_value=' \
               '&term_node_tid_depth=All' \
               "&page=#{cur_page}"

    begin
      retries = ENV.fetch('RETRIES') { RETRIES }
      Timeout.timeout(0) do
        parsed = URI.parse(base_url).open(ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
                                          read_timeout: ENV.fetch('READ_TIMEOUT') { READ_TIMEOUT },
                                          encoding: Encoding::UTF_8,
                                          'Accept-Language' => 'en-US,en;q=0.8,ru;q=0.6',
                                          'User-Agent' => USER_AGENT,
                                          'Referer' => 'https://data.gov.ru/organizations/')
        Nokogiri::HTML(parsed, nil, 'UTF-8')
      end
    rescue Timeout::Error
      retries -= 1
      sleep(5)
      retries.zero? and raise

      retry
    end
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
      add_tpi(anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2').to_s)
    end
  end
  memoize :scrape
end
