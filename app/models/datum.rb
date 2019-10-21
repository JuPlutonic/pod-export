# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :integer          not null, primary key
#  mime       :string
#  date       :date                      # TODO: Add sorting (ASC)
#  converted  :boolean
#  author     :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null # REMOVE AUTO_SORTING (DESC)
#  pod_id     :integer
#

class Datum < ApplicationRecord
  with_options dependent: :destroy do
    belongs_to :pod, foreign_key: :tax_payer_id, inverse_of: :data
    has_one :json_dataset
  end

  validates :tax_payer_id, presence: true
end
