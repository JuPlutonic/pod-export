# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :bigint           not null, primary key
#  author     :string
#  converted  :boolean
#  date       :date
#  gov_code   :string
#  mime       :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_data_on_gov_code  (gov_code)
#
class Datum < ApplicationRecord
  DATASET_URL1 = '//article/div[6]/div[2]/div/a'
  DATASET_URL2 = '//article/div[7]/div[2]/div/a'
  DATASET_URL3 = '//article/div[8]/div[2]/div/a'

  with_options dependent: :destroy do
    belongs_to :pod, foreign_key: :gov_code, inverse_of: :data
    has_one :json_dataset
  end

  default_scope { order(updated_at: :asc) }
  validates :gov_code, presence: true

  attr_reader :tax_payer_id

  def tax_payer_id=(params)
    scrape_pod_description call_nokogiri_for_pod(params.to_i)
  end

  private

  extend Memoist
  require 'open-uri'

  # ----------------------Additional Pod's field scrapping----------------------
  def call_nokogiri_for_pod(pod_id)
    base_url = "https://data.gov.ru/organizations/#{pod_id}"
    Nokogiri::HTML(URI.parse(base_url).open, nil, 'UTF-8')
  end
  # memoize :call_nokogiri_for_pod

  def scrape_pod_description(doc)
    @short_name  = doc
                   .xpath('//article/div[2]/div[2]/div')
                   .text.strip
    @type_of_o   = doc
                   .xpath('//article/div[4]/div[2]/div/a')
                   .text.strip
    @type_of_o1  = doc
                   .xpath('//article/div[4]/div[2]/div/a')
    @type_of_o2  = doc
                   .xpath('//article/div[4]/div[2]/div/a/text()').to_s
    @site1       = doc
                   .css('div.field:nth-child(6) > div:nth-child(2) > div:nth-child(1) > a:nth-child(1)[href^="http"]')
                   .to_s
    @site2       = doc
                   .xpath('//article/div[5]/div[2]/div/a').xpath('@href').to_s
    @dataset_url = if doc.xpath(DATASET_URL1).present?
                     doc.xpath(DATASET_URL1).xpath('@href').to_s
                   elsif doc.xpath(DATASET_URL2).present?
                     doc.xpath(DATASET_URL2).xpath('@href').to_s
                   elsif doc.xpath(DATASET_URL3).present?
                     doc.xpath(DATASET_URL3).xpath('@href').to_s
                   else
                     ''
                   end
    @oktmo = doc
             .xpath('//article/div[7]/div[2]/div/a/text()').to_s
    @oktmo1 = doc
              .xpath('//article/div[7]/div[2]/div/a')
              .text.strip
    @oktmo2 = doc
              .xpath('//article/div[7]/div[2]/div/a')
  end
  # memoize :scrape_pod_description
  # ----------------------------------------------------------------------------

  # ----------------Collecting json datasets------------------------------------
  def scrape_data(tax_payer_id)
    # call_nokogiri_for_pod(tax_payer_id)
  end
  # ----------------------------------------------------------------------------
end
