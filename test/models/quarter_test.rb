require "test_helper"

class QuarterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save blank quarters" do
    quarter = Quarter.new
    assert_not quarter.save, "Saved the blank quarter"
  end

  test "should not save quarters without quarter_num" do
    quarter = Quarter.new(year: 2027)
    assert_not quarter.save, "Saved the quarter without quarter_num"
  end

  test "should not save quarters without year" do
    quarter = Quarter.new(quarter_num: 1)
    assert_not quarter.save, "Saved the quarter without year"
  end

  # Non-numeric values tests
  test "should not save quarters with non-numeric year" do
    quarter = Quarter.new(year: "Test", quarter_num: 1)
    assert_not quarter.save, "Saved the quarter with non-numeric year"
  end

  test "should not save quarters with non-numeric quarter_num" do
    quarter = Quarter.new(year: 2000, quarter_num: "ASDF")
    assert_not quarter.save, "Saved the quarter with non-numeric quarter_num"
  end

  # Tests for quarter_num range
  test "should not save quarters with quarter_num below 1" do
    quarter = Quarter.new(year: 2000, quarter_num: 0)
    assert_not quarter.save, "Saved the quarter with quarter_num below 1"
  end

  test "should not save quarters with quarter_num being negative" do
    quarter = Quarter.new(year: 2000, quarter_num: -1)
    assert_not quarter.save, "Saved the quarter with quarter_num being negative"
  end

  test "should not save quarters with quarter_num above 4" do
    quarter = Quarter.new(year: 2000, quarter_num: 5)
    assert_not quarter.save, "Saved the quarter with quarter_num above 4"
  end

  # Non-integer tests
  test "should not save quarters with non-integer year" do
    quarter = Quarter.new(year: 2000.1, quarter_num: 1)
    assert_not quarter.save, "Saved the quarter with non-integer year"
  end

  test "should not save quarters with non-integer quarter" do
    quarter = Quarter.new(year: 2000, quarter_num: 1.2)
    assert_not quarter.save, "Saved the quarter with non-integer quarter"
  end

  # Nil tests
  test "should not save quarters with nil quarter_num" do
    quarter = Quarter.new(year: 2027, quarter_num: nil)
    assert_not quarter.save, "Saved the quarter with nil quarter_num"
  end

  test "should not save quarters with nil year" do
    quarter = Quarter.new(year: nil, quarter_num: 3)
    assert_not quarter.save, "Saved the quarter with nil year"
  end

  # Valid
  test "should save quarters with name and valid price" do
    quarter = Quarter.new(year: 2026, quarter_num: 2)
    assert quarter.save, "Didn't save the quarter with valid year and quarter_num"
  end

  # Uniqueness check
  test "should not save quarters with name and valid price but are duplicate" do
    original_quarter = Quarter.create(year: 2026, quarter_num: 2)
    quarter = Quarter.new(year: 2026, quarter_num: 2)
    assert_raises ActiveRecord::RecordNotUnique do
      quarter.save
    end
  end
end
