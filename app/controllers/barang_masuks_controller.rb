class BarangMasuksController < ApplicationController
  before_action :set_barang_masuk, only: [:show, :edit, :update, :destroy]

  # GET /barang_masuks
  # GET /barang_masuks.json
  def index
    @barang_masuks = BarangMasuk.page(params[:page])
  end

  # GET /barang_masuks/1
  # GET /barang_masuks/1.json
  def show
  end

  # GET /barang_masuks/new
  def new
    @barang_masuk = BarangMasuk.new
  end

  # GET /barang_masuks/1/edit
  def edit
  end

  # POST /barang_masuks
  # POST /barang_masuks.json
  def create
    @barang_masuk = BarangMasuk.new(barang_masuk_params)

    respond_to do |format|
      if @barang_masuk.save
        format.html { redirect_to @barang_masuk, notice: 'Barang masuk was successfully created.' }
        format.json { render :show, status: :created, location: @barang_masuk }
      else
        format.html { render :new }
        format.json { render json: @barang_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barang_masuks/1
  # PATCH/PUT /barang_masuks/1.json
  def update
    respond_to do |format|
      if @barang_masuk.update(barang_masuk_params)
        format.html { redirect_to @barang_masuk, notice: 'Barang masuk was successfully updated.' }
        format.json { render :show, status: :ok, location: @barang_masuk }
      else
        format.html { render :edit }
        format.json { render json: @barang_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barang_masuks/1
  # DELETE /barang_masuks/1.json
  def destroy
    @barang_masuk.destroy
    respond_to do |format|
      format.html { redirect_to barang_masuks_url, notice: 'Barang masuk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barang_masuk
      @barang_masuk = BarangMasuk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barang_masuk_params
      params.require(:barang_masuk).permit(:barang_id, :no_transaksi, :jumlah, :tgl_masuk, :note)
    end
end
