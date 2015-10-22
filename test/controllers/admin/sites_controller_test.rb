require 'test_helper'

class Admin::SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:one)
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
  
  test "should not create site with short name" do
    assert_no_difference('Site.count') do
      post :create, site: { name: "aaaaa", title: "def" }
    end

    assert_response :success
  end
  
  test "should not create site with long name" do
    assert_no_difference('Site.count') do
      post :create, site: { name: "12345678901234567", title: "def" }
    end

    assert_response :success
  end
  
  test "should not create site with capitalized name" do
    assert_no_difference('Site.count') do
      post :create, site: { name: "ABCDEFG", title: "def" }
    end

    assert_response :success
  end
  
  test "should not create site with empty name" do
    assert_no_difference('Site.count') do
      post :create, site: { name: "", title: "def" }
    end

    assert_response :success
  end
  
  test "should not create site with empyt title" do
    assert_no_difference('Site.count') do
      post :create, site: { name: "abcdef", title: "" }
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
    patch :update, id: @site, site: { name: "abcaaaaa", title: "def" }
    assert_redirected_to admin_site_path(assigns(:site))
  end
  
  test "should not update site with empty name" do
    patch :update, id: @site, site: { name: "", title: "def" }
    assert_response :success
  end
  
  test "should not update site with short name" do
    patch :update, id: @site, site: { name: "aaaaa", title: "def" }
    assert_response :success
  end
  
  test "should not update site with long name" do
    patch :update, id: @site, site: { name: "12345678901234567", title: "def" }
    assert_response :success
  end
  
  test "should not update site with capitalized name" do
    patch :update, id: @site, site: { name: "ABCDEFG", title: "def" }
    assert_response :success
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
