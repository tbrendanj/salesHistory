require "test_helper"

class ProductFlowTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  # index page
  test "Can see the product index" do
    get "/products"
    assert_dom "a", "Add product"
  end

  # new page
  test "Can create a new product" do
    get "/products/new"
    assert_response :success

    post "/products",
    params: { product: { name: "Shirt", price: 1 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_dom "h1", "Shirt"
  end
  test "Can rerender when failing to create an invalid new product" do
    get "/products/new"
    assert_response :success

    post "/products",
    params: { product: { name: nil, price: nil } }
    assert_response :unprocessable_content
    assert_dom "h1", "Add product"
  end

  # show page
  test "Can display existing product records" do
    get "/products/#{@product.id}"
    assert_dom "h1", "MyString"
  end

  test "Can redirect records not found back to the index page" do
    get "/products/100"
    assert_response :redirect
    follow_redirect!
    assert_dom "a", "Add product"
  end
end
