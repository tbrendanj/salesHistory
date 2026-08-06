require "test_helper"

class SaleFlowTest < ActionDispatch::IntegrationTest
  setup do
    @quarter = quarters(:one)
    @product = products(:one)
    @sale = sales(:one)
  end

  # index page
  test "Can see the sale index" do
    get "/sales"
    assert_dom "a", "Add sale"
  end

  # new page
  test "Can create a new sale" do
    get "/sales/new"
    assert_response :success

    post "/sales",
    params: { sale: { Product_id: @product.id, Quarter_id: @quarter.id, quantity: 1 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_dom "h2", "Product"
  end
  test "Can rerender when failing to create an invalid new sale" do
    get "/sales/new"
    assert_response :success

    post "/sales",
    params: { sale: { Product: nil, Quarter: nil, quantity: nil } }
    assert_response :unprocessable_content
    assert_dom "h1", "Add sale"
  end

  # show page
  test "Can display existing sale records" do
    get "/sales/#{@sale.id}"
    assert_dom "h2", "Product"
  end
  test "Can redirect records not found back to the index page" do
    get "/sales/100"
    assert_response :redirect
    follow_redirect!
    assert_dom "a", "Add sale"
  end
end
