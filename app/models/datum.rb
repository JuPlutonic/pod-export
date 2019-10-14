# frozen_string_literal: true

class Datum < ApplicationRecord
  belongs_to :pod
  has_one :json_dataset
end
