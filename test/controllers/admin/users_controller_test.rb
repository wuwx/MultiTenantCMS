require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: 'aaaa', email: 'xxxxx@sina.com', password: 'password' }
    end

    assert_redirected_to admin_user_path(assigns(:user))
  end
  
  test "should not create user with empty name" do
    assert_no_difference('User.count') do
      post :create, user: { name: '', email: 'xxxxx@sina.com', password: 'password' }
    end

    assert_response :success
  end
  
  test "should not create user with empty email" do
    assert_no_difference('User.count') do
      post :create, user: { name: 'ccccc', email: '', password: 'password' }
    end

    assert_response :success
  end
  
  test "should not create user with empty password" do
    assert_no_difference('User.count') do
      post :create, user: { name: 'ccccc', email: '', password: '' }
    end

    assert_response :success
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { name: @user.name }
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to admin_users_path
  end
end
