require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test
  def test_it_exists
    checky = CreditCheck.new(79927398713)
    assert_instance_of CreditCheck, checky
  end

  def test_it_accepts_a_cc_number
    checky = CreditCheck.new(79927398713)
    assert_equal 79927398713, checky.cc_number
  end

  def test_it_splits_the_numbers_apart
    checky = CreditCheck.new(79927398713)
    assert_equal ["7","9","9","2","7","3","9","8","7","1","3"], checky.split_digits
  end

  def test_it_revereses_the_numbers
    checky = CreditCheck.new(79927398713)
    checky.split_digits
    assert_equal ["3", "1", "7", "8", "9", "3", "7", "2", "9", "9", "7"], checky.reverse
  end

  def test_it_multiplies_every_other_digit_by_two
    checky = CreditCheck.new(79927398713)
    checky.split_digits
    checky.reverse
    assert_equal [3, 2, 7, 16, 9, 6, 7, 4, 9, 18, 7], checky.double_every_other
  end

  def test_it_adds_double_digits
    checky = CreditCheck.new(79927398713)
    checky.split_digits
    checky.reverse
    checky.double_every_other
    assert_equal [3,2,7,7,9,6,7,4,9,9,7], checky.add_double_digits
  end

  def test_it_adds_all_the_numbers_together
    checky = CreditCheck.new(79927398713)
    checky.split_digits
    checky.reverse
    checky.double_every_other
    checky.add_double_digits
    assert_equal 70, checky.add_numbers
  end

  def test_it_is_evenly_divisible_by_10?
    checky = CreditCheck.new(79927398713)
    checky.split_digits
    checky.reverse
    checky.double_every_other
    checky.add_double_digits
    checky.add_numbers
    assert checky.divisible_by_ten
  end

  def test_it_works_on_another_number
    checky = CreditCheck.new(4024007136512380)
    checky.split_digits
    checky.reverse
    checky.double_every_other
    checky.add_double_digits
    checky.add_numbers
    assert checky.divisible_by_ten
  end

  def test_it_fails_when_expected
    checky = CreditCheck.new(5541801923795240)
    checky.split_digits
    checky.reverse
    checky.double_every_other
    checky.add_double_digits
    checky.add_numbers
    refute checky.divisible_by_ten
  end
end
