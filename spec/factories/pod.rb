# frozen_string_literal: true

FactoryBot.define do
  factory :pod_elem_retriever, class: 'Pod' do
    sequence(:tax_payer_id) { |n| "11001001#{n.to_s.rjust(2, '0')}" }
  end

  factory :pod_description, class: 'Pod' do
    organization { 'Pod' }
    pod_code { '123901' }
    tax_payer_id { '11001001aA' }
  end

  factory :invalid_pod, class: 'Pod' do
    organization { nil }
    pod_code { nil }
    tax_payer_id { nil }
  end
end
