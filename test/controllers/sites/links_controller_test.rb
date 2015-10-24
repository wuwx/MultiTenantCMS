require 'test_helper'

class Sites::LinksControllerTest < ActionController::TestCase
  setup do
    @site = FactoryGirl.create(:site)
    sign_in @site.user
  end

  test "should get index" do
    get :index, site_id: @site
    assert_response :success
  end
end
