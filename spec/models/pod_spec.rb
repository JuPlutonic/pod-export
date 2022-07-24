# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id             :bigint           not null, primary key
#  government_led :boolean          default(FALSE)
#  kind           :string
#  organization   :string
#  pod_code       :string           default("gen_random_uuid()"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tax_payer_id   :string
#
# Indexes
#
#  index_pods_on_government_led  (government_led)
#  index_pods_on_pod_code        (pod_code) UNIQUE
#
require 'rails_helper'

RSpec.describe Pod, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:pod_description) }

    it { should validate_presence_of(:pod_code) }
    it { should validate_uniqueness_of(:pod_code).ignoring_case_sensitivity }
    it { should validate_presence_of(:tax_payer_id) }
  end
end
