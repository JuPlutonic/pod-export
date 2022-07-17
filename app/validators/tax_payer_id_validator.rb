# frozen_string_literal: true

# Russian "INN" validation with control sums
class TaxPayerIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    TaxPayerIdOperation.new(value).call and return

    record.errors[attribute] << (options
      .merge(value: value)
      .merge(message: 'Указан неверный ИНН'))
  end
end
