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
  describe 'validations' do
    subject { FactoryBot.create(:pod_description) }

    it { is_expected.to validate_presence_of(:tax_payer_id) }
    it { is_expected.to validate_uniqueness_of(:tax_payer_id) }
    # it { is_expected.to validate_presence_of(:organization).on(:create) }
  end
end
