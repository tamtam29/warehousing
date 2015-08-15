require 'test_helper'

class BarangsControllerTest < ActionController::TestCase
  setup do
    @barang = barangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barang" do
    assert_difference('Barang.count') do
      post :create, barang: { code: @barang.code, name: @barang.name }
    end

    assert_redirected_to barang_path(assigns(:barang))
  end

  test "should show barang" do
    get :show, id: @barang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barang
    assert_response :success
  end

  test "should update barang" do
    patch :update, id: @barang, barang: { code: @barang.code, name: @barang.name }
    assert_redirected_to barang_path(assigns(:barang))
  end

  test "should destroy barang" do
    assert_difference('Barang.count', -1) do
      delete :destroy, id: @barang
    end

    assert_redirected_to barangs_path
  end
end
