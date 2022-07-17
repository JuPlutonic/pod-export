# frozen_string_literal: true

# :reek:UncommunicativeMethodName number - position of the control number
class TaxPayerIdOperation
  COEFFICIENTS_FOR_N10 = [2, 4, 10, 3, 5, 9, 4, 6, 8, 0].freeze
  COEFFICIENTS_FOR_N11 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8, 0].freeze
  COEFFICIENTS_FOR_N12 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8, 0].freeze

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def call
    value.to_i.zero? and return false

    check || false
  end

  private

  def check
    vls = value.to_s.chars
    case vls.size
    when 12
      if vls[0..1] == %w[0 0]
        checksum_n10 vls[2..]
      elsif vls[-2..] == %w[- 1]
        checksum_n10 vls[0..-3]
      else
        checksum_n11_and_n12 vls
      end
    when 10
      checksum_n10 vls
    end
  end

  def checksum_n10(vls)
    vls.last == checksum(vls, COEFFICIENTS_FOR_N10)
  end

  def checksum_n11_and_n12(vls)
    vls.last == checksum(vls, COEFFICIENTS_FOR_N12) and
      vls[-2] == checksum(vls, COEFFICIENTS_FOR_N11)
  end

  def checksum(vls, coefficients)
    res = coefficients.each_with_index.inject(0) do |coll, pair|
      coeff, index = pair
      coll += vls[index].to_i * coeff
      coll
    end % 11 % 10
    res.to_s
  end
end
