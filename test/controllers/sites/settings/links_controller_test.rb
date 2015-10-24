require 'test_helper'

class Sites::Settings::LinksControllerTest < ActionController::TestCase
  setup do
    @link = FactoryGirl.create(:link)
    @site = @link.site
    sign_in @site.user
  end

  test "should get index" do
    get :index, site_id: @site
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get new" do
    get :new, site_id: @site
    assert_response :success
  end

  test "should create link" do
    assert_difference('Link.count') do
      post :create, site_id: @site, link: { name: "Name" }
    end

    assert_redirected_to site_settings_links_path(@site)
  end

  test "should get edit" do
    get :edit, site_id: @site, id: @link
    assert_response :success
  end

  test "should update link" do
    patch :update, site_id: @site, id: @link, link: { name: "Name" }
    assert_redirected_to site_settings_links_path(@site)
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, site_id: @site, id: @link
    end

    assert_redirected_to site_settings_links_path(@site)
  end
end
