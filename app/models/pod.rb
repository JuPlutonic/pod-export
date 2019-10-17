# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id            :integer          not null, primary key
#  organization  :string
#  tax_payers_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pod < ApplicationRecord
  has_many :data, dependent: :restrict_with_exception, primary_key: :tax_payers_id
  has_many :json_datasets, through: :datum, primary_key: :tax_payers_id
  validates :tax_payers_id, length: { is: 10 || 12 }, presence: true, uniqueness: true

  # Filter
  # Sends post-query to URI. Here scrape updates variarles.
  # def filter(keyword)
  #   get('/search', query: { q: keyword })['pods']
  #   scrape
  # end
end
