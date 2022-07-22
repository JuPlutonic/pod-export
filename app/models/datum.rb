# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :bigint           not null, primary key
#  author     :string
#  converted  :boolean
#  date       :date
#  mime       :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pod_id     :bigint
#
# Indexes
#
#  index_data_on_pod_id  (pod_id)
#
# Foreign Keys
#
#  fk_rails_...  (pod_id => pods.id)
#
class Datum < ApplicationRecord
  with_options dependent: :destroy do
    belongs_to :pod, foreign_key: :gov_code, inverse_of: :data
    has_one :json_dataset
  end

  validates :gov_code, presence: true
end
