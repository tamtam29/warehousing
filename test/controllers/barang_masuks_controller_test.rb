require 'test_helper'

class BarangMasuksControllerTest < ActionController::TestCase
  setup do
    @barang_masuk = barang_masuks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barang_masuks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barang_masuk" do
    assert_difference('BarangMasuk.count') do
      post :create, barang_masuk: { no_transaksi: @barang_masuk.no_transaksi }
    end

    assert_redirected_to barang_masuk_path(assigns(:barang_masuk))
  end

  test "should show barang_masuk" do
    get :show, id: @barang_masuk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barang_masuk
    assert_response :success
  end

  test "should update barang_masuk" do
    patch :update, id: @barang_masuk, barang_masuk: { no_transaksi: @barang_masuk.no_transaksi }
    assert_redirected_to barang_masuk_path(assigns(:barang_masuk))
  end

  test "should destroy barang_masuk" do
    assert_difference('BarangMasuk.count', -1) do
      delete :destroy, id: @barang_masuk
    end

    assert_redirected_to barang_masuks_path
  end
end
