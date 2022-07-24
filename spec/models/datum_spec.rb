# frozen_string_literal: true

# == Schema Information
#
# Table name: data
#
#  id         :bigint           not null, primary key
#  author     :string
#  converted  :boolean
#  date       :date
#  gov_code   :string
#  mime       :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_data_on_gov_code  (gov_code)
#
require 'rails_helper'

RSpec.describe Datum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
