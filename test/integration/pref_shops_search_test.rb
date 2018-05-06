require 'test_helper'

class PrefShopsTest < ActionDispatch::IntegrationTest
  
  def setup
    prefecures(:one)
    prefecures(:two)
    prefecures(:three)
    shops(:one)
    shops(:two)
    shops(:three)
    shops(:four)
    shops(:five)
    shops(:six)
    shops(:seven)
  end

  test "should get search" do
    get search_shops, as: :json
    assert_response :success
  end
end
