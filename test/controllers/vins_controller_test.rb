require 'test_helper'

class VinsControllerTest < ActionController::TestCase
  setup do
    @vin = vins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vin" do
    assert_difference('Vin.count') do
      post :create, vin: { description: @vin.description }
    end

    assert_redirected_to vin_path(assigns(:vin))
  end

  test "should show vin" do
    get :show, id: @vin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vin
    assert_response :success
  end

  test "should update vin" do
    patch :update, id: @vin, vin: { description: @vin.description }
    assert_redirected_to vin_path(assigns(:vin))
  end

  test "should destroy vin" do
    assert_difference('Vin.count', -1) do
      delete :destroy, id: @vin
    end

    assert_redirected_to vins_path
  end
end
