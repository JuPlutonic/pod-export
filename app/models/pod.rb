# frozen_string_literal: true

class Pod < ApplicationRecord
  has_many :datum

  # Filter
  # Sends post-query to URI. Here scrape updates variarles.
  # def filter(keyword)
  #   get('/search', query: { q: keyword })['pods']
  #   scrape
  # end
end
