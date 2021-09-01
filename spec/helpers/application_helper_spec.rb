# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  ident_els = Array.new(20) { '1100100120' }
  let(:emptycell) { ApplicationHelper::EMPTYCELL }
  let(:fullcell) { ApplicationHelper::FULLCELL }

  progrsn_els = [] # Progression
  (1..20).each { |n| progrsn_els << (1_100_100_100 + n).to_s }

  describe 'helper adds to array future captions of the buttons' do
    it 'when resulting array consist of same ids, and helper shows \'получить данные\'' do
      expect(helper.elem_retrieval(ident_els).uniq!).to eq [emptycell]
    end

    it 'when array have different ids and the last id in it from ident_els array' do
      expect(helper.elem_retrieval(progrsn_els).uniq!.count).to eq 1
    end
  end

  describe 'helper shows what all ids are already existed (fabricated)' do
    it 'when pods ids coincide with el-s from progression, and helper shows \'показать данные\'' do
      create_list(:pod_elem_retriever, 20)
      expect(helper.elem_retrieval(progrsn_els).uniq!).to eq [fullcell]
    end
  end
end
