# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id             :bigint           not null
#  organization   :string
#  tax_payer_id   :string           primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  kind           :string
#  government_led :boolean          default(FALSE)
#  pod_code       :string           not null
#
class Pod < ApplicationRecord
  self.primary_key = 'tax_payer_id'

  has_many :json_datasets, through: :datum
  # rubocop:disable Rails/InverseOf
  with_options foreign_key: :gov_code, primary_key: :pod_code do
    has_many :data, dependent: :restrict_with_exception
    has_many :budget_participants, dependent: :delete_all
  end
  # rubocop:enable Rails/InverseOf

  enum kind: { federal: 'federal',
               municipal: 'municipal',
               regional: 'regional' }

  scope :government_led, -> { where(government_led: true) }
  scope :president_led, -> { where(government_led: false) }

  validates :pod_code, presence: true, uniqueness: true
  validates :tax_payer_id, presence: true, tax_payer_id: true

  accepts_nested_attributes_for :data, reject_if: proc { |attributes|
                                                    attributes[:converted].blank?
                                                  }, allow_destroy: true
end
