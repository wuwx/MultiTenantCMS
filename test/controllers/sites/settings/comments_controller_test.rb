require 'test_helper'

class Sites::Settings::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = FactoryGirl.create(:comment)
    @site = @comment.site
    sign_in @site.user
  end

  test "should get index" do
    get :index, site_id: @site
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    assert_raises ActionController::UrlGenerationError do
      get :new, site_id: @site
    end
  end

  test "should create comment" do

    assert_raises ActionController::UrlGenerationError do
      post :create, site_id: @site, comment: { content: "Content" }
    end
  end

  test "should not get edit" do
    assert_raises ActionController::UrlGenerationError do
      get :edit, site_id: @site, id: @comment
    end
  end

  test "should update comment" do
    assert_raises ActionController::UrlGenerationError do
      patch :update, site_id: @site, id: @comment, comment: { content: "Content" }
    end
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, site_id: @site, id: @comment
    end

    assert_redirected_to site_settings_comments_path(@site)
  end
end
