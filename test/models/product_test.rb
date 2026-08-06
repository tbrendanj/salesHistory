require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save blank products" do
    product = Product.new
    assert_not product.save, "Saved the blank product"
  end

  test "should not save products without name" do
    product = Product.new(price: 10.11)
    assert_not product.save, "Saved the product without name"
  end

  test "should not save products without price" do
    product = Product.new(name: "Test")
    assert_not product.save, "Saved the product without price"
  end

  test "should not save products with non-numeric price" do
    product = Product.new(name: "Test", price: "Test")
    assert_not product.save, "Saved the product with non-numeric price"
  end

  test "should not save products with nil price" do
    product = Product.new(name: "Test", price: nil)
    assert_not product.save, "Saved the product with nil price"
  end

  test "should not save products with nil name" do
    product = Product.new(name: nil, price: 3)
    assert_not product.save, "Saved the product with nil name"
  end

  test "should not save products with negative price" do
    product = Product.new(name: "Test", price: -1.00)
    assert_not product.save, "Saved the product with negative price"
  end

  test "should save products with name and valid price" do
    product = Product.new(name: "Test", price: 10000000.00)
    assert product.save, "Didn't save the product with name and valid price"
  end
end
