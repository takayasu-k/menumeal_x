require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  def setup
    prefectures(:one)
    @shop = shops(:one)
  end

  test "should get search" do
    get shops_search_by_prefecture_url(prefecture_id: 1), as: :json
    assert_response :success
  end
end