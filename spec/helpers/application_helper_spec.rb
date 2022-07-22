# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  let(:emptycell) { ApplicationHelper::EMPTYCELL }
  let(:fullcell) { ApplicationHelper::FULLCELL }

  identical_els = Array.new(20) { Faker::Russian.inn }
  different_els = []
  20.times { different_els << Faker::Russian.inn }
  dup_different_els = different_els.dup

  describe 'helper adds to array default captions of the buttons' do
    it 'when resulting array consist of same tpis, and helper shows \'получить данные\'' do
      expect(helper.elem_retrieval(identical_els).uniq!).to eq [emptycell]
    end
  end

  describe 'helper shows what all tpis are already existed (fabricated)' do
    it 'when tpis coincide with el-s from scrapped tpis, and helper shows \'показать данные\'' do
      expect(helper.elem_retrieval(dup_different_els).uniq!).to eq [fullcell]
    end
  end
end
