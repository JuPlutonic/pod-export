# frozen_string_literal: true

class Pod < ApplicationRecord
  require 'open-uri'

  URL = 'https://data.gov.ru/organizations'

  has_many :datum

  def initialize; end

  # Filter
  # If button pressed it sends get-query. Scrape will update showing table.
  # def self.for(keyword)
  #   get('/search', query: { q: keyword })['pods'] # response:  count: value pods: value
  #   scrape
  # end

private

  def scrape
    @pod_names = []
    @pod_ids = []
    doc = Nokogiri::HTML(open(URL), nil, 'UTF-8')
    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      @pod_names << anchor.text

    # gsub do deletion of /organization/ - it remains only taxpayer's id
      @pod_ids << anchor.xpath('@href').to_s.gsub(/(\/\w+\/)(\d+)/, '\2')
    end
  end
end
