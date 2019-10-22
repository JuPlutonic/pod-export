# frozen_string_literal: true

class PageNav
  include ActiveModel::Model
  extend Memoizable

  attr_reader :page
  attr_accessor :limit, :pod_organizations, :pod_ids, :last_page

  def initialize(first_page)
    @pod_organizations ||= []
    @pod_ids ||= []
    @page ||= 0
    page = first_page.to_i
    @last_page ||= page

    scrape(first_page)
    @limit = 20
  end

  # Strange implementation of pod_organizations and pod_ids caching
  #   for views if we don't changing page but pushing 'Visit page' button.
  #            (controllers/pods/index.html.slim)
  def page=(new_page)
    return if new_page == page

    @pod_organizations = []
    @pod_ids = []
    @page = new_page
    scrape(new_page)
  end

  def to_model
    self
  end

  def to_key
    current_page
  end

  def persisted?
    false
  end

  def scrape_data(pod); end

  private

  # rubocop:disable Metrics/AbcSize
  # TODO: Filter '' needs to be passed by default.
  # TODO: base_url with the page number query need to be implemented.
  memoized def scrape(cur_page)
    require 'open-uri'

    base_url = "https://data.gov.ru/organizations?page=#{cur_page}"
    doc = Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
    # TODO: TEST crawling when base_url have only one page (expect @last_page.to be 0)
    # If we start browsing base_url, li[12] will be the last paginated table
    if cur_page.zero?
      @last_page = doc
                   .xpath('//div[3]/ul/li[12]/a')
                   .to_s
                   .gsub(/^.*=/, '') # removes unuseful parts of url query
                   .gsub(/\D/, '').to_i # removes non digit parts of html tags
    end

    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      pod_organizations << anchor.text.strip

      # gsub does deletion of /organization/ - it remains only taxpayer's id:
      pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2').to_s
    end
  end
  # rubocop:enable Metrics/AbcSize
end
