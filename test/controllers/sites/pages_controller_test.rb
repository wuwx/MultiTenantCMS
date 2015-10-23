require 'test_helper'

class Sites::PagesControllerTest < ActionController::TestCase
  setup do
    @page = FactoryGirl.create(:page)
    sign_in @page.user
  end
  
  test "should get index" do
    get :index, :site_id => @page.site
    assert_response :success
    assert_not_nil assigns(:pages)
  end
end
