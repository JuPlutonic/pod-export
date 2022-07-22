# frozen_string_literal: true

FactoryBot.define do
  factory :pod_description, class: 'Pod' do
    pod_code { Digest::UUID.uuid_v4 }
    tax_payer_id { Faker::Russian.inn }
  end

  factory :invalid_pod, class: 'Pod' do
    organization { nil }
    pod_code { nil }
    tax_payer_id { nil }
  end
end
