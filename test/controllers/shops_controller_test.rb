require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  def setup
    prefectures(:one)
    prefectures(:two)
    prefectures(:three)
    shops(:one)
    shops(:two)
    shops(:three)
    shops(:four)
    shops(:five)
    shops(:six)
    shops(:seven)
  end

  test "should get search" do
    get search_shops_url, as: :json
    assert_response :success
  end
end
