# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxPayerIdOperation do
  describe '#call' do
    context 'when tpi is filled' do
      it 'returns false for tpi filled with zeros' do
        expect(described_class.new('0000000000').call).to be_falsey
      end

      it 'is true for the proper tax_payer_id' do
        expect(described_class.new('8080808099').call).to be true
      end
    end
  end
end
