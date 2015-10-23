require 'test_helper'

class Sites::PostsControllerTest < ActionController::TestCase
  setup do
    @post = FactoryGirl.create(:post)
    sign_in @post.user
  end
  
  test "should get index" do
    get :index, :site_id => @post.site
    assert_response :success
    assert_not_nil assigns(:posts)
  end
  
end
