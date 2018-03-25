require 'test_helper'

class AchievementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get achievement_index_url
    assert_response :success
  end

end
