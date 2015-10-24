require 'test_helper'

class Sites::PagesControllerTest < ActionController::TestCase
  setup do
    @page = FactoryGirl.create(:page)
    sign_in @page.user
  end

  test "should show page" do
    get :show, site_id: @page.site, id: @page
    assert_response :success
  end
end
