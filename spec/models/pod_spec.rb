# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id            :integer          not null, primary key
#  organization  :string
#  tax_payer_id  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Pod, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
