# frozen_string_literal: true

# == Schema Information
#
# Table name: pods
#
#  id             :bigint           not null, primary key
#  dataset_url    :string
#  government_led :boolean          default(FALSE)
#  kind           :string
#  oktmo          :string
#  organization   :string
#  pod_code       :uuid             not null
#  short_name     :string
#  site           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tax_payer_id   :string
#
# Indexes
#
#  index_pods_on_government_led  (government_led)
#
require 'rails_helper'

RSpec.describe Pod, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:pod_description) }

    it { should validate_presence_of(:tax_payer_id) }
  end
end
