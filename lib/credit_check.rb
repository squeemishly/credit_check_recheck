require 'pry'
class CreditCheck
  attr_reader :cc_number,
              :split_number,
              :doubled_number,
              :single_digits,
              :total,
              :valid

  def initialize(cc_number)
    @cc_number = cc_number
    @split_number = nil
    @doubled_number = []
    @single_digits = []
    @total = 0
    @valid = false
  end

  def split_digits
    @split_number = cc_number.to_s.split('')
  end

  def reverse
    @split_number = split_number.reverse
  end

  def double_every_other
    split_number.each_with_index do |number, index|
      number = number.to_i
      if index.odd?
        number = number * 2
      end
      @doubled_number << number
    end
    doubled_number
  end

  def add_double_digits
    @single_digits = doubled_number.map do |number|
      if number >= 10
        number = number.to_s.split('')
        number = number[0].to_i + number[1].to_i
      end
      number
    end
  end

  def add_numbers
    single_digits.each do |digit|
      @total += digit
    end
    total
  end

  def divisible_by_ten
    if @total % 10 == 0
      @valid = true
    end
    @valid
  end

end
