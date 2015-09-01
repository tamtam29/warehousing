class PreOrdersController < ApplicationController
  before_action :set_barang_keluar, only: [:show]

  def index
    @barang_keluars = BarangKeluar.where("payment_type like 'A2' AND state like 'Pre Order'").order("no_transaksi DESC").page(params[:page])
  end

  def show
  end

  def new
    @barang_keluar = BarangKeluar.new
    @barang_keluar.tgl_keluar = DateTime.now.strftime("%Y/%m/%d %H:%m")
    @barang_keluar.detail_barang_keluars.build

    query = params[:name] ? params[:name].downcase : ""
    if query != ""
      @stocks = Stock.joins(:barang)
                     .where("(lower(barangs.code) like '%#{query}%' OR
                              lower(barangs.name) like '%#{query}%')")
                     .order("barangs.code ASC")
                     .page(params[:page]).per(5)
    else
      @stocks = Stock.where("id = 0").page(params[:page])
    end
  end

  def create
    params[:barang_keluar][:detail_barang_keluars_attributes].each do |item|
      barang = Barang.find(item[1][:barang_id])
      # Barang keluar category
      old_category = barang.category
      barang_keluar_category = BarangKeluarCategory.find_or_create_by(old_category.serializable_hash(except: [:id]))
      # Barang keluar barang
      old_barang = barang
      barang_keluar_barang = BarangKeluarBarang.where(old_barang.serializable_hash(except: [:id, :category_id, :gambar_barang_file_name, :gambar_barang_content_type, :gambar_barang_file_size, :gambar_barang_updated_at]))
                                               .where(barang_keluar_category_id: barang_keluar_category.id).first
      if !barang_keluar_barang
        barang_keluar_barang = BarangKeluarBarang.new(old_barang.serializable_hash(except: [:id, :category_id, :gambar_barang_file_name, :gambar_barang_content_type, :gambar_barang_file_size, :gambar_barang_updated_at]))
        barang_keluar_barang.barang_keluar_category_id = barang_keluar_category.id
        barang_keluar_barang.save
      end
      # Barang keluar promo
      old_promo = barang.promo
      if old_promo
        barang_keluar_promo = BarangKeluarPromo.where(old_promo.serializable_hash(except: [:id, :barang_id]))
                                               .where(barang_keluar_barang_id: barang_keluar_barang.id).first
        if !barang_keluar_promo
          barang_keluar_promo = BarangKeluarPromo.new(old_promo.serializable_hash(except: [:id, :barang_id]))
          barang_keluar_promo.barang_keluar_barang_id = barang_keluar_barang.id
          barang_keluar_promo.save
        end
      end
      item[1]["barang_keluar_barang_id"] = barang_keluar_barang.id
    end

    @barang_keluar = BarangKeluar.new(barang_keluar_params)
    @barang_keluar.payment_type = "A2"
    @barang_keluar.state = "Pre Order"
    @barang_keluar.no_transaksi = BarangKeluar.generate_no_transaksi
    respond_to do |format|
      if @barang_keluar.save
        format.html { redirect_to pre_order_path(@barang_keluar), notice: 'Pre Order was successfully created.' }
        format.json { render :show, status: :created, location: @barang_keluar }
      else
        format.html { render :new }
        format.json { render json: @barang_keluar.errors, status: :unprocessable_entity }
      end
    end
  end

  def form_bayar_po
    @barang_keluar = BarangKeluar.find(params[:pre_order_id])
    @barang_keluar_pre_order = BarangKeluarPreOrder.new()
    @barang_keluar_pre_order.pre_order_date = DateTime.now.strftime("%Y/%m/%d %H:%m")
  end

  def bayar_po
    barang_keluar = BarangKeluar.find(params[:pre_order_id])
    params[:barang_keluar_pre_order]["barang_keluar_id"] = barang_keluar.id
    @barang_keluar_pre_order = BarangKeluarPreOrder.new(barang_keluar_pre_order_params)
    respond_to do |format|
      if @barang_keluar_pre_order.save
        barang_keluar.state = "Lunas"
        barang_keluar.save
        format.html { redirect_to show_bayar_po_path(params[:pre_order_id]), notice: 'Pre Order was successfully paid.' }
        format.json { render :show, status: :created, location: @barang_keluar }
      else
        format.html { redirect_to form_bayar_po_path(params[:pre_order_id]) }
        format.json { render json: @barang_keluar_pre_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_bayar_po
    @barang_keluar = BarangKeluar.find(params[:pre_order_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barang_keluar
      @barang_keluar = BarangKeluar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barang_keluar_params
      params.require(:barang_keluar).permit(:id, :no_transaksi, :tgl_keluar, :grand_total, :pre_order, :bayar, :kembalian, :payment_type, :detail_barang_keluars_attributes => [:id, :barang_keluar_id, :barang_keluar_barang_id, :jumlah, :total_harga_awal, :total_harga, :pre_order])
    end

    def barang_keluar_pre_order_params
      params.require(:barang_keluar_pre_order).permit(:id, :barang_keluar_id, :bayar, :kembalian, :pre_order_date)
    end
end
