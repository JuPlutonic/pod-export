# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper.
RSpec.describe ApplicationHelper, type: :helper do
  # Call 'before' with 'FactoryBot'
  #   to have Pod.all with some fabricated records (tax_payer_ids) same as elements
  # FactoryBot.define do
  #   sequence(:tax_payer_id, 20) { '11001001' + n.to_s.rjust(2, '0') }
  #   factory :pod do
  #     :tax_payer_id
  #   end
  # end

  # tested_elements2 = []
  # (0..19).each { |n| tested_elements2 << (1_100_100_100 + n).to_s }

  # tested_elements = Array.new(20, '1100100120')

  describe 'helper adds to array future captions of the buttons' do
    xit 'resulting array consist only of \'получить данные\' elements' do
      expect(helper.elem_retrieval(tested_elements)).to have 'получить данные'
      expect(helper.elem_retrieval(tested_elements).uniq!.count).to eq 1
    end
    xit 'where is some \'показать данные\' element when others are \'получить данные\' elements' do
      expect(helper.elem_retrieval(tested_elements2)).to have 'показать данные'
    end
  end

  # Launch Database cleaner.
end
