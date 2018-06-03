require 'test_helper'

class PrefShopsControllerTest < ActionDispatch::IntegrationTest
  def setup
    prefectures(:one)
    shops(:one)
  end

  test "should get search" do
    get pref_shops_search_url, as: :json
    assert_response :success
  end
end
