require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = FactoryGirl.create(:site)
  end

  test "should show site" do
    get :show, id: @site
    assert_response :success
    assert_select 'title', "MultiTenantCMS"
  end

end
