# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id             :bigint           not null, primary key
#  government_led :boolean          default(FALSE)
#  kind           :string
#  organization   :string
#  pod_code       :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tax_payer_id   :string
#
# Indexes
#
#  index_pods_on_government_led  (government_led)
#  index_pods_on_pod_code        (pod_code) UNIQUE
#
class Pod < ApplicationRecord
  has_many :json_datasets, through: :datum
  with_options foreign_key: :gov_code, primary_key: :pod_code do
    has_many :data, dependent: :restrict_with_exception, inverse_of: :pod
    has_many :budget_participants, dependent: :delete_all, inverse_of: :pod
  end

  enum kind: { federal: 'federal',
               municipal: 'municipal',
               regional: 'regional' }

  scope :government_led, -> { where(government_led: true) }
  scope :president_led, -> { where(government_led: false) }

  validates :pod_code, presence: true, uniqueness: true
  validates :tax_payer_id, presence: true, tax_payer_id: true

  accepts_nested_attributes_for :budget_participants
  accepts_nested_attributes_for :data, reject_if: proc { |attributes|
                                                    attributes[:converted].blank?
                                                  }, allow_destroy: true
end
