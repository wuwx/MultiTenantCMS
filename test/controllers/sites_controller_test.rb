require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = FactoryGirl.create(:site)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

end
