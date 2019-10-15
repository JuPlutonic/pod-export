# frozen_string_literal: true

class Pod < ApplicationRecord
  URI = 'https://data.gov.ru/organizations'

  has_many :datum

  def initialize
    doc = Nokogiri::HTML(URI.parse(URL), nil, 'UTF-8')
  end

  # Filter
  # Sends post-query to URI. Here scrape updates variarles.
  # def filter(keyword)
  #   get('/search', query: { q: keyword })['pods']
  #   scrape
  # end

  private

  def scrape
    @pod_names = []
    @pod_ids = []

    doc = doc.xpath('//tbody')
    doc.xpath('//td[2]/a').each do |anchor|
      @pod_names << anchor.text

      # gsub do deletion of /organization/ - it remains only taxpayer's id
      @pod_ids << anchor.xpath('@href').to_s.gsub(%r{(/\w+/)(\d+)}, '\2')
    end
  end
end
