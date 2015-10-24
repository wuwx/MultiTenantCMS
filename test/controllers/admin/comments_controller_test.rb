require 'test_helper'

class Admin::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = FactoryGirl.create(:comment)

    @user = FactoryGirl.create(:admin)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to admin_comments_path
  end
end
