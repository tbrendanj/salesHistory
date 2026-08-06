require "test_helper"

class QuarterFlowTest < ActionDispatch::IntegrationTest
  setup do
    @quarter = quarters(:one)
  end

  # index page
  test "Can see the quarter index" do
    get "/"
    assert_dom "a", "Add quarter"
  end

  # new page
  test "Can create a new quarter" do
    get "/quarters/new"
    assert_response :success

    post "/quarters",
    params: { quarter: { year: 2027, quarter_num: 1 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_dom "h1", "2027 Q1"
  end
  test "Can rerender when failing to create an invalid new quarter" do
    get "/quarters/new"
    assert_response :success

    post "/quarters",
    params: { quarter: { year: nil, quarter_num: nil } }
    assert_response :unprocessable_content
    assert_dom "h1", "Add quarter"
  end

  # show page
  test "Can display existing quarter records" do
    get "/quarters/#{@quarter.id}"
    assert_dom "h1", "2026 Q1"
  end
  test "Can redirect records not found back to the index page" do
    get "/quarters/100"
    assert_response :redirect
    follow_redirect!
    assert_dom "a", "Add quarter"
  end
end
