# frozen_string_literal: true

# :reek:InstanceVariableAssumption
class PageNav
  include ActiveModel::Model
  RECORDS_PER_PAGE_ON_TARGETED_SITE = 20
  # TODO: UA round-robin and resending of time-outed query
  USER_AGENT =
    %[Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) \
      Chrome/58.0.3029.110 Safari/537.36]
  # %[Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) \
  #   Chrome/90.0.4430.212 Safari/537.36]
  READ_TIMEOUT = 42

  attr_reader :last_page, :page

  def initialize(first_page)
    # Runs the scrapping with Nokogiri.
    @page = extract_page_from_raw_params(first_page)

    same_page?(@page)
    @last_page = scrape_last_page
    scrape_when_initialized
  end

  # TODO: Change ubiq. ivars names. DANGER parsing/content can be hidden fr. app
  # ---------------ivars with parsing content-----------------------------------
  def pod_organizations
    @pod_organizations = instance_variable_get(:@pod_organizations) || []
  end

  def pod_ids
    @pod_ids = instance_variable_get(:@pod_ids) || []
  end

  def add_pod_organizations(organization)
    pod_organizations << organization if organization.present?
  end

  def add_pod_ids(id)
    pod_ids << id if id.present?
  end
  # -----------------------------------------------------------------------------

  # Pod_organizations and pod_ids are accessed by method 'scape'
  # So if we don't changing page, but pushing 'Visit page' button
  #   we'll see no load. The button is on controllers/pods/index.html.slim page.
  def same_page?(raw_page)
    return if page == raw_page

    # Redo the scrapping, rememoize with true.
    doc = call_nokogiri_default_page(raw_page, true)
    scrape(doc, true)
  end

  # ---------------SimpleForm methods.------------------------------------------
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
  #   It sends post-query to URI. Here scrape updates variables.
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

  # Memoization
  extend Memoist
  require 'open-uri'

  #  --------------Implementation template which is collecting json data-sets.--
  # def scrape_data(pod)
  #   call_nokogiri_selected_pod_page
  # end

  # def call_nokogiri_selected_pod_page; end
  # ----------------------------------------------------------------------------

  # TODO: User may filter page results. Filter '' needs to be passed by default.
  def call_nokogiri_default_page(cur_page = 0)
    base_url = 'https://data.gov.ru/organizations?field_organization_inn_value=' \
               '&title=' \
               '&field_organization_short_name_value=' \
               '&term_node_tid_depth=All' \
               "&page=#{cur_page}"
    Nokogiri::HTML(URI.parse(base_url).open(:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE,
                                            :read_timeout => READ_TIMEOUT,
                                            :encoding => Encoding::UTF_8,
                                            'Accept-Language' => 'en-US,en;q=0.8,ru;q=0.6',
                                            'User-Agent' => USER_AGENT,
                                            'Referer' => 'https://data.gov.ru/organizations/'), nil, 'UTF-8')
  end
  memoize :call_nokogiri_default_page

  # TODO: TEST crawling when base_url have only one page (where is no pagination on the target site).
  def scrape_last_page
    # When we start browsing from the first page, li[12] will be the last paginated table.
    call_nokogiri_default_page
      .xpath('//div[3]/ul/li[12]/a')
      .to_s
      .gsub(/^.*=/, '') # - removes useful parts of url query.
      .gsub(/\D/, '').to_i # - removes non digit parts of html tags.
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

      # gsub is doing deletion of /organization/ - it remains only taxpayer's id:
      add_pod_ids(anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2').to_s)
      # FIXME: Glitches: P8 /administraciya-kostromskoy-oblasti, P3 /administraciya-vladimirskoy-oblasti
      # FIXME: __Appearing only if the type of the organizations is "regional".
    end
  end
  memoize :scrape
end
