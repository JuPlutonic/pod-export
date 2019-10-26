# frozen_string_literal: true

class PageNav
  include ActiveModel::Model
  RECORDS_PER_PAGE_ON_TARGETED_SITE = 20

  attr_reader :page
  attr_accessor :last_page, :limit, :pod_organizations, :pod_ids

  def initialize(first_page)
    @limit = RECORDS_PER_PAGE_ON_TARGETED_SITE

    @pod_organizations ||= []
    @pod_ids ||= []
    page = first_page.respond_to?(:to_i) ? first_page.to_i : first_page[:page].to_i - 1

    # Run the scrapping with Nokogiri.
    doc = call_nokogiri_default_page
    @last_page = scrape_last_page(doc)
    doc = call_nokogiri_default_page(page, true) unless page.zero?
    scrape(doc)
  end

  # @pod_organizations and @pod_ids are hold by method 'scape' memoization.
  #                                                            gem Memoist'
  # So if we don't changing page, but pushing 'Visit page' button
  #   we'll see no load. The button is on controllers/pods/index.html.slim page.
  def page=(new_page)
    new_page = new_page.respond_to?(:to_i) ? new_page.to_i : new_page[:page].to_i - 1
    return if new_page == page

    # First time scrapped data must be cleared.
    @pod_organizations = []
    @pod_ids = []
    # Setter
    @page = new_page
    # Redo the scrapping, Rememoize with true.
    doc = call_nokogiri_default_page(new_page, true)
    scrape(doc, true)
  end

  # ---------------Simple form methods.-----------------------------------------
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

  extend Memoist
  require 'open-uri'

  #  ---------------Implementation template which is collecting json datasets.--
  def scrape_data(pod)
    # call_nokogiri_selected_pod_page
  end

  # def call_nokogiri_selected_pod_page; end
  # ----------------------------------------------------------------------------

  # TODO: User may filter page results. Filter '' needs to be passed by default.
  def call_nokogiri_default_page(cur_page = 0)
    base_url = "https://data.gov.ru/organizations?page=#{cur_page}"
    Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
  end
  memoize :call_nokogiri_default_page

  # TODO: TEST crawling when base_url have only one page (where is no pagination on the target site).
  def scrape_last_page(doc)
    # When we start browsing from the first page, li[12] will be the last paginated table.
    doc
      .xpath('//div[3]/ul/li[12]/a')
      .to_s
      .gsub(/^.*=/, '') # - removes useful parts of url query.
      .gsub(/\D/, '').to_i # - removes non digit parts of html tags.
  end
  memoize :scrape_last_page

  def scrape(doc)
    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      pod_organizations << anchor.text.strip

      # gsub is doing deletion of /organization/ - it remains only taxpayer's id:
      pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2').to_s
      # FIXME: Glitches: P8 /administraciya-kostromskoy-oblasti, P3 /administraciya-vladimirskoy-oblasti
      # FIXME: __Appearing only if the type of the organizations is "regional".
    end
  end
  memoize :scrape
end
