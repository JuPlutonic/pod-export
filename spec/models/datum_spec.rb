# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :integer          not null, primary key
#  mime       :string
#  date       :date
#  converted  :boolean
#  author     :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null (by default PG sorts table DESC by this column)
#  pod_id     :integer
#

require 'rails_helper'

RSpec.describe Datum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
