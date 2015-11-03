require 'test_helper'

class Sites::DashboardsControllerTest < ActionController::TestCase

  setup do
    @site = FactoryGirl.create(:site)
  end

  test "should show dashboard" do
    get :show, site_id: @site
    assert_response :success
    assert_select 'title', "MultiTenantCMS"
  end

end
