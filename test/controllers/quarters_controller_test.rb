require "test_helper"

class QuartersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quarter = quarters(:one)
  end

  test "should get index" do
    get quarters_url
    assert_response :success
  end

  test "should get new" do
    get new_quarter_url
    assert_response :success
  end

  test "should create quarter" do
    assert_difference("Quarter.count") do
      post quarters_url, params: { quarter: { year: 2026, quarter_num: 2 } }
    end

    assert_redirected_to quarter_url(Quarter.last)
  end

  test "should show quarter" do
    get quarter_url(@quarter)
    assert_response :success
  end
end
