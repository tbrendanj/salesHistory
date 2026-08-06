require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @quarter = quarters(:one)
    @product = products(:one)
    @sale = sales(:one)
  end

  test "Sale creation flow" do
    visit sales_path

    click_on "Add sale"

    select @product.id, from: "sale_Product_id"
    select "2026 Q1", from: "sale_Quarter_id"
    fill_in "Quantity", with: 1

    click_on "Create Sale"

    assert_text "MyString"
    assert_text "2026 Q1"
  end
end
