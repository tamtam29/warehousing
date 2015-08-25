class BarangKeluarsController < ApplicationController
  load_and_authorize_resource
  before_action :set_barang_keluar, only: [:show, :edit, :update, :destroy]

  # GET /barang_keluars
  # GET /barang_keluars.json
  def index
    @barang_keluars = BarangKeluar.all
  end

  # GET /barang_keluars/1
  # GET /barang_keluars/1.json
  def show
  end

  # GET /barang_keluars/new
  def new
    @barang_keluar = BarangKeluar.new
    @barang_keluar.detail_barang_keluars.build

    query = params[:name] ? params[:name].downcase : ""
    @stocks = Stock.joins(:barang).where("(lower(barangs.code) like '%#{query}%' or lower(barangs.name) like '%#{query}%')").page(params[:page]).per(5)
  end

  # GET /barang_keluars/1/edit
  def edit
  end

  # POST /barang_keluars
  # POST /barang_keluars.json
  def create
    params[:barang_keluar][:detail_barang_keluars_attributes].each do |item|
      barang = Barang.find(item[1][:barang_id])
      # Barang keluar category
      old_category = barang.category
      barang_keluar_category = BarangKeluarCategory.find_or_create_by(old_category.serializable_hash(except: [:id]))
      # Barang keluar barang
      old_barang = barang
      barang_keluar_barang = BarangKeluarBarang.where(old_barang.serializable_hash(except: [:id, :category_id])).where(barang_keluar_category_id: barang_keluar_category.id).first
      if !barang_keluar_barang
        barang_keluar_barang = BarangKeluarBarang.new(old_barang.serializable_hash(except: [:id, :category_id]))
        barang_keluar_barang.barang_keluar_category_id = barang_keluar_category.id
        barang_keluar_barang.save
      end
      # Barang keluar promo
      old_promo = barang.promo
      if old_promo
        barang_keluar_promo = BarangKeluarPromo.where(old_promo.serializable_hash(except: [:id, :barang_id])).where(barang_keluar_barang_id: barang_keluar_barang.id).first
        if !barang_keluar_promo
          barang_keluar_promo = BarangKeluarPromo.new(old_promo.serializable_hash(except: [:id, :barang_id]))
          barang_keluar_promo.barang_keluar_barang_id = barang_keluar_barang.id
          barang_keluar_promo.save
        end
      end
      item[1]["barang_keluar_barang_id"] = barang_keluar_barang.id
    end

    @barang_keluar = BarangKeluar.new(barang_keluar_params)
    @barang_keluar.no_transaksi = BarangKeluar.generate_no_transaksi
    respond_to do |format|
      if @barang_keluar.save
        decrease_stock(params[:barang_keluar][:detail_barang_keluars_attributes])
        format.html { redirect_to @barang_keluar, notice: 'Barang keluar was successfully created.' }
        format.json { render :show, status: :created, location: @barang_keluar }
      else
        format.html { render :new }
        format.json { render json: @barang_keluar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barang_keluars/1
  # PATCH/PUT /barang_keluars/1.json
  def update
    respond_to do |format|
      if @barang_keluar.update(barang_keluar_params)
        format.html { redirect_to @barang_keluar, notice: 'Barang keluar was successfully updated.' }
        format.json { render :show, status: :ok, location: @barang_keluar }
      else
        format.html { render :edit }
        format.json { render json: @barang_keluar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barang_keluars/1
  # DELETE /barang_keluars/1.json
  def destroy
    @barang_keluar.destroy
    respond_to do |format|
      format.html { redirect_to barang_keluars_url, notice: 'Barang keluar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barang_keluar
      @barang_keluar = BarangKeluar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barang_keluar_params
      params.require(:barang_keluar).permit(:id, :no_transaksi, :grand_total, :bayar, :kembalian, :detail_barang_keluars_attributes => [:id, :barang_keluar_id, :barang_keluar_barang_id, :jumlah, :total_harga_awal, :total_harga])
    end

    def decrease_stock(detail_barang_keluars)
      detail_barang_keluars.each do |detail_barang_keluar|
        stok_barang = Stock.find(detail_barang_keluar[1][:barang_id])
        stok_barang.jumlah = stok_barang.jumlah.to_i - detail_barang_keluar[1][:jumlah].to_i
        stok_barang.save
      end
    end
end
