require 'test_helper'

class Sites::Settings::CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = FactoryGirl.create(:category)
    @site = @category.site
    sign_in @site.user
  end

  test "should get index" do
    get :index, site_id: @site
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new, site_id: @site
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, site_id: @site, category: { name: "Name" }
    end

    assert_redirected_to site_settings_categories_path(@site)
  end

  test "should get edit" do
    get :edit, site_id: @site, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, site_id: @site, id: @category, category: { name: "Name" }
    assert_redirected_to site_settings_categories_path(@site)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, site_id: @site, id: @category
    end

    assert_redirected_to site_settings_categories_path(@site)
  end
end
