# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id             :bigint           not null
#  organization   :string
#  tax_payer_id   :string           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  kind           :string
#  government_led :boolean          default(FALSE)
#
require 'rails_helper'

RSpec.describe Pod, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:pod_description) }

    it { is_expected.to validate_presence_of(:tax_payer_id) }
    it { is_expected.to validate_uniqueness_of(:tax_payer_id) }
  end
end
