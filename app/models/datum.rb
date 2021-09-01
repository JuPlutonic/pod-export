# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :bigint           not null, primary key
#  mime       :string
#  date       :date
#  converted  :boolean
#  author     :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pod_id     :integer
#
# TODO: User must see data, sorted (ASC) by date. Now, by default it's sorted (DESC) by updated_at.
class Datum < ApplicationRecord
  with_options dependent: :destroy do
    belongs_to :pod, foreign_key: :tax_payer_id, inverse_of: :data
    has_one :json_dataset
  end

  validates :tax_payer_id, presence: true
end
