# frozen_string_literal: true

require 'rails_helper'
require 'byebug'

RSpec.describe TaxPayerIdOperation do
  describe '#call' do
    context 'when tpi is filled' do
      it 'returns false for tpi filled with zeros' do
        expect(described_class.new('0000000000').call).to be_falsey
      end

      it 'is true for one recoverable tax_payer_id' do
        expect(described_class.new('8901017082-0').call).to be true
      end

      it 'is true for another recoverable tax_payer_id' do
        expect(described_class.new('005247051127').call).to be true
      end
    end
  end
end
