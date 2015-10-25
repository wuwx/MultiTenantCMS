require 'test_helper'

class Settings::SitesControllerTest < ActionController::TestCase
  setup do
    @site = FactoryGirl.create(:site)
  end

  test "should get index" do
    @user = FactoryGirl.create(:user)
    sign_in @user
    
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "user should get new" do
    @user = FactoryGirl.create(:user)
    sign_in @user

    get :new
    assert_response :success
  end

  test "user should create site" do
    sign_in @site.user

    assert_difference('Site.count') do
      post :create, site: { title: "def" }
    end

    assert_redirected_to site_path(assigns(:site))
  end

  test "user should not create site with empyt title" do
    sign_in @site.user

    assert_no_difference('Site.count') do
      post :create, site: { title: "" }
    end

    assert_response :success
  end

  test "guest should not get edit" do
    get :edit, id: @site
    
    assert_redirected_to new_user_session_path
  end

  test "guest should not update site" do
    patch :update, id: @site, site: { name: "abcaaaaa", title: "def" }
    
    assert_redirected_to new_user_session_path
  end

  test "user should get edit" do
    @user = @site.user
    sign_in @user

    get :edit, id: @site
    assert_response :success
  end

  test "user should update site" do
    @user = @site.user
    sign_in @user

    patch :update, id: @site, site: { title: "defg" }
    assert_redirected_to site_path(assigns(:site))
  end
end
