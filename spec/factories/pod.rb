# frozen_string_literal: true

FactoryBot.define do
  factory :pod_description, class: 'Pod' do
    tax_payer_id { '11001001aA' }
    # organization { 'Pod'}
  end

  factory :pod_elem_retriever, class: 'Pod' do
    sequence(:tax_payer_id) { |n| "11001001#{n.to_s.rjust(2, '0')}" }
  end

  factory :invalid_pod, class: 'Pod' do
    tax_payer_id nil
    # organization nil
  end
end
