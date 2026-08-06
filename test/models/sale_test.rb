require "test_helper"

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # Valid
  test "should not save sales with no quarter" do
    @product = products(:one)
    sale = Sale.new(Product: @product, quantity: 1)
    assert_not sale.save, "Saved the no product sale"
  end
  test "should not save sales with no product" do
    @quarter = quarters(:one)
    sale = Sale.new(Quarter: @quarter, quantity: 1)
    assert_not sale.save, "Saved the no product sale"
  end
  test "should not save sales with negative quantity" do
    @product = products(:one)
    @quarter = quarters(:one)
    sale = Sale.new(Product: @product, Quarter: @quarter, quantity: -1)
    assert_not sale.save, "Saved the negative quantity sale"
  end
  test "should not save sales with decimal quantity" do
    @product = products(:one)
    @quarter = quarters(:one)
    sale = Sale.new(Product: @product, Quarter: @quarter, quantity: 1.1)
    assert_not sale.save, "Saved the decimal quantity sale"
  end
  test "should not save sales with no quantity" do
    @product = products(:one)
    @quarter = quarters(:one)
    sale = Sale.new(Product: @product, Quarter: @quarter)
    assert_not sale.save, "Saved the no quantity sale"
  end
  test "should save sales with valid product, quarter, and quantity" do
    @product = products(:one)
    @quarter = quarters(:one)
    sale = Sale.new(Product: @product, Quarter: @quarter, quantity: 1)
    assert sale.save, "Didn't save the valid sale"
  end
end
