# frozen_string_literal: true

# Russian "INN" validation with control sums
class TaxPayerIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    TaxPayerIdChecker.new(value).call and return

    record.errors.add(attribute, (options[:message]&.merge(tax_payer_id: value) ||
                                  "Указан неверный ИНН #{value}"))
  end
end
