require 'test_helper'

class DetailBarangKeluarsControllerTest < ActionController::TestCase
  setup do
    @detail_barang_keluar = detail_barang_keluars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_barang_keluars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_barang_keluar" do
    assert_difference('DetailBarangKeluar.count') do
      post :create, detail_barang_keluar: { jumlah: @detail_barang_keluar.jumlah }
    end

    assert_redirected_to detail_barang_keluar_path(assigns(:detail_barang_keluar))
  end

  test "should show detail_barang_keluar" do
    get :show, id: @detail_barang_keluar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_barang_keluar
    assert_response :success
  end

  test "should update detail_barang_keluar" do
    patch :update, id: @detail_barang_keluar, detail_barang_keluar: { jumlah: @detail_barang_keluar.jumlah }
    assert_redirected_to detail_barang_keluar_path(assigns(:detail_barang_keluar))
  end

  test "should destroy detail_barang_keluar" do
    assert_difference('DetailBarangKeluar.count', -1) do
      delete :destroy, id: @detail_barang_keluar
    end

    assert_redirected_to detail_barang_keluars_path
  end
end
