require 'test_helper'

class BarangKeluarsControllerTest < ActionController::TestCase
  setup do
    @barang_keluar = barang_keluars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barang_keluars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barang_keluar" do
    assert_difference('BarangKeluar.count') do
      post :create, barang_keluar: { no_transaksi: @barang_keluar.no_transaksi }
    end

    assert_redirected_to barang_keluar_path(assigns(:barang_keluar))
  end

  test "should show barang_keluar" do
    get :show, id: @barang_keluar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barang_keluar
    assert_response :success
  end

  test "should update barang_keluar" do
    patch :update, id: @barang_keluar, barang_keluar: { no_transaksi: @barang_keluar.no_transaksi }
    assert_redirected_to barang_keluar_path(assigns(:barang_keluar))
  end

  test "should destroy barang_keluar" do
    assert_difference('BarangKeluar.count', -1) do
      delete :destroy, id: @barang_keluar
    end

    assert_redirected_to barang_keluars_path
  end
end
