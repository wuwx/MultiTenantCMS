require 'test_helper'

class Admin::SitesControllerTest < ActionController::TestCase
  setup do
    @site = FactoryGirl.create(:site)
    sign_in @site.user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post :create, site: { name: "abcdef", title: "def" }
    end

    assert_redirected_to admin_site_path(assigns(:site))
  end

  test "should not create site with empyt title" do
    assert_no_difference('Site.count') do
      post :create, site: { title: "" }
    end

    assert_response :success
  end

  test "should show site" do
    get :show, id: @site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site
    assert_response :success
  end

  test "should update site" do
    patch :update, id: @site, site: { title: "def" }
    assert_redirected_to admin_site_path(assigns(:site))
  end

  test "should not update site with empty title" do
    patch :update, id: @site, site: { name: "abc", title: "" }
    assert_response :success
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete :destroy, id: @site
    end

    assert_redirected_to admin_sites_path
  end
end
