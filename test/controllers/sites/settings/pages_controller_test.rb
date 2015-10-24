require 'test_helper'

class Sites::Settings::PagesControllerTest < ActionController::TestCase
  setup do
    @page = FactoryGirl.create(:page)
    @site = @page.site
    sign_in @site.user
  end

  test "should get index" do
    get :index, site_id: @site
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new, site_id: @site
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, site_id: @site, page: { title: "Title", content: "Content" }
    end

    assert_redirected_to edit_site_settings_page_path(@site, assigns(:page))
  end

  test "should get edit" do
    get :edit, site_id: @site, id: @page
    assert_response :success
  end

  test "should update page" do
    patch :update, site_id: @site, id: @page, page: { title: "Title", content: "Content" }
    assert_redirected_to edit_site_settings_page_path(@site, @page)
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, site_id: @site, id: @page
    end

    assert_redirected_to site_settings_pages_path(@site)
  end
end
