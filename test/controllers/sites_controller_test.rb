require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "user should get new" do
    @user = users(:one)
    sign_in @user

    get :new
    assert_response :success
  end

  test "user should create site" do
    @user = users(:one)
    sign_in @user

    assert_difference('Site.count') do
      post :create, site: { name: "abcdef", title: "def" }
    end

    assert_redirected_to site_path(assigns(:site))
  end

  test "should show site" do
    get :show, id: @site
    assert_response :success
  end

  test "user should get edit" do
    @user = users(:one)
    sign_in @user

    assert_raises Pundit::NotAuthorizedError do
      get :edit, id: @site
    end
  end

  test "user should update site" do
    @user = users(:one)
    sign_in @user

    assert_raises Pundit::NotAuthorizedError do
      patch :update, id: @site, site: { name: "abcaaaaa", title: "def" }
    end
  end

end
