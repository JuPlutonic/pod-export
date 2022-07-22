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
require 'rails_helper'

RSpec.describe Datum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
