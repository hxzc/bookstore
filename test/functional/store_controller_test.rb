require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.left a', minimum:2
    assert_select '.entry', minimum:2
  end
end
