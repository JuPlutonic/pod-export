# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  tested_elements = Array.new(20) { '1100100120' }

  tested_elements2 = []
  (1..20).each { |n| tested_elements2 << (1_100_100_100 + n).to_s }

  describe 'helper adds to array future captions of the buttons' do
    it 'resulting array consist of \'получить данные\' elements' do
      expect(helper.elem_retrieval(tested_elements).uniq!).to eq ['получить данные']
    end

    it 'resulting array consist only of one \'получить данные\' element' do
      expect(helper.elem_retrieval(tested_elements).uniq!.count).to eq 1
    end

    it 'where is some \'показать данные\' element when others are \'получить данные\' elements' do
      create_list(:pod_elem_retriever, 20)
      expect(helper.elem_retrieval(tested_elements2).uniq!).to eq ['показать данные']
    end
  end
end
