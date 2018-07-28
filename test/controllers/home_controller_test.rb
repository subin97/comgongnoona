require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get program" do
    get :program
    assert_response :success
  end

  test "should get game" do
    get :game
    assert_response :success
  end

  test "should get graphic" do
    get :graphic
    assert_response :success
  end

  test "should get develop" do
    get :develop
    assert_response :success
  end

  test "should get storage" do
    get :storage
    assert_response :success
  end

  test "should get battery" do
    get :battery
    assert_response :success
  end

  test "should get display" do
    get :display
    assert_response :success
  end

  test "should get weight" do
    get :weight
    assert_response :success
  end

  test "should get brand" do
    get :brand
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
