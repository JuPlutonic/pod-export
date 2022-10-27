# frozen_string_literal: true

require 'rails_helper'

# Personal TaxPayerId is 10 numbered code
# Organizational TaxPayerId is 12 numbered code
# TaxPayerId can be recovered in singular condition:
# it formally was personal TaxPayerId and in the Persistence this number have
# 12 numbers (with prefixed two zeros or with '-0' at the end)
RSpec.describe TaxPayerIdChecker do
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
