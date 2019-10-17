# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id           :integer          not null, primary key
#  organization :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Pod < ApplicationRecord
  has_many :datum
  validates :id, length: { is: 10 || 12 }, presence: true

  # Filter
  # Sends post-query to URI. Here scrape updates variarles.
  # def filter(keyword)
  #   get('/search', query: { q: keyword })['pods']
  #   scrape
  # end
end
