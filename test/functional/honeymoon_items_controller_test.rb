require 'test_helper'

class HoneymoonItemsControllerTest < ActionController::TestCase
  setup do
    @honeymoon_item = honeymoon_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:honeymoon_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create honeymoon_item" do
    assert_difference('HoneymoonItem.count') do
      post :create, honeymoon_item: {  }
    end

    assert_response 201
  end

  test "should show honeymoon_item" do
    get :show, id: @honeymoon_item
    assert_response :success
  end

  test "should update honeymoon_item" do
    put :update, id: @honeymoon_item, honeymoon_item: {  }
    assert_response 204
  end

  test "should destroy honeymoon_item" do
    assert_difference('HoneymoonItem.count', -1) do
      delete :destroy, id: @honeymoon_item
    end

    assert_response 204
  end
end
