require 'test_helper'

class Sites::Settings::PostsControllerTest < ActionController::TestCase
  setup do
    @post = FactoryGirl.create(:post)
    @site = @post.site
    sign_in @site.user
  end

  test "should get index" do
    get :index, site_id: @site
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new, site_id: @site
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, site_id: @site, post: { title: "Title", content: "Content" }
    end

    assert_redirected_to edit_site_settings_post_path(@site, assigns(:post))
  end

  test "should get edit" do
    get :edit, site_id: @site, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, site_id: @site, id: @post, post: { title: "Title", content: "Content" }
    assert_redirected_to edit_site_settings_post_path(@site, @post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, site_id: @site, id: @post
    end

    assert_redirected_to site_settings_posts_path(@site)
  end
end
