require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
  setup do
    @post = FactoryGirl.create(:post)

    @user = FactoryGirl.create(:admin)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { title: "Title", content: "Content" }
    assert_redirected_to admin_post_path(assigns(:post))
  end

  test "should not update post with empty title" do
    patch :update, id: @post, post: { title: "", content: "Content" }
    assert_response :success
  end

  test "should not update post with empty content" do
    patch :update, id: @post, post: { title: "Title", content: "" }
    assert_response :success
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to admin_posts_path
  end
end
