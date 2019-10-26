# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id            :integer          not null, primary key
#  organization  :string
#  tax_payer_id :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pod < ApplicationRecord
  self.primary_key = 'tax_payer_id'
  has_many :data, dependent: :restrict_with_exception, primary_key: :tax_payer_id
  has_many :json_datasets, through: :datum
  # validates :tax_payer_id, presence: true, uniqueness: true
  accepts_nested_attributes_for :data, reject_if: proc { |attributes| attributes[:converted].blank? }, allow_destroy: true
end
