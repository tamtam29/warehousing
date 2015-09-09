class ReportsController < ApplicationController
  def index
    no_transaksi = params[:no_transaksi] ? params[:no_transaksi].upcase : ""
    start_date = params[:start_date] ? params[:start_date] : ""
    end_date = params[:end_date] ? params[:end_date] : ""

    if start_date == "" or end_date == ""
      query_date = nil
    else
      query_date = "AND CAST(barang_keluars.tgl_keluar as DATE) BETWEEN '#{start_date}' AND '#{end_date}'"
    end
    if query_date != nil
      @barang_keluars = BarangKeluar.where("UPPER(barang_keluars.no_transaksi) like '%#{no_transaksi}%'
                                            AND state like 'Lunas'
                                            #{query_date}")
                                    .order("barang_keluars.no_transaksi DESC")
                                    .page(params[:page])
    else
      @barang_keluars = BarangKeluar.where("id = 0").page(params[:page])
    end

    authorize! :read, BarangKeluar
  end

  def show
    @barang_keluar = BarangKeluar.find(params[:id])
    authorize! :read, BarangKeluar
  end

  def report_barang_masuk
    name = params[:name] ? params[:name].upcase : ""
    start_date = params[:start_date] ? params[:start_date] : ""
    end_date = params[:end_date] ? params[:end_date] : ""

    if start_date == "" or end_date == ""
      query_date = nil
    else
      query_date = "CAST(barang_masuks.tgl_keluar as DATE) BETWEEN '#{start_date}' AND '#{end_date}'"
    end

    if query_date != nil
      @barang_masuks = BarangMasuk.joins(:barang)
                                  .where("UPPER(barang_masuks.no_transaksi) like '%#{name}%' OR
                                          UPPER(barangs.name) like '%#{name}%' OR
                                          UPPER(barangs.code) like '%#{name}%'")
                                  .where("#{query_date}")
                                  .order("barang_masuks.no_transaksi DESC")
                                  .page(params[:page])
    else
      @barang_masuks = BarangMasuk.where("id = 0").page(params[:page])
    end

    authorize! :manage, BarangMasuk
  end

  def show_report_barang_masuk
    @barang_masuk = BarangMasuk.find(params[:id])
    authorize! :manage, BarangMasuk
  end

  def report_pemasukan
    start_date = params[:start_date] ? params[:start_date] : ""
    end_date = params[:end_date] ? params[:end_date] : ""

    if start_date == "" or end_date == ""
      query_date = nil
    else
      query_date = "AND CAST(barang_keluars.tgl_keluar as DATE) BETWEEN '#{start_date}' AND '#{end_date}'"
    end
    if query_date != nil
      @barang_keluars = BarangKeluar.select("DATE(tgl_keluar) as tanggal, sum(grand_total) as grand_total")
                                    .where("state like 'Lunas' #{query_date}")
                                    .group("DATE(tgl_keluar)")
                                    .order("tanggal ASC")
                                    .page(params[:page])
      @grand_total = BarangKeluar.where("state like 'Lunas' #{query_date}")
                                 .select("DISTINCT sum(grand_total) as nominal")
    else
      @barang_keluars = BarangKeluar.where("id = 0").page(params[:page])
    end

    authorize! :manage, User
  end

  # save to excel ===============================================================================================
  def pemasukan_rumah_asi_bjn
    start_date = params[:start_date] ? params[:start_date] : ""
    end_date = params[:end_date] ? params[:end_date] : ""

    if start_date == "" or end_date == ""
      query_date = nil
    else
      query_date = "AND CAST(barang_keluars.tgl_keluar as DATE) BETWEEN '#{start_date}' AND '#{end_date}'"
    end
    if query_date != nil
      @barang_keluars = BarangKeluar.select("DATE(tgl_keluar) as tanggal, sum(grand_total) as grand_total")
                                    .where("state like 'Lunas' #{query_date}")
                                    .group("DATE(tgl_keluar)")
                                    .order("tanggal ASC")
                                    .page(params[:page])
      @grand_total = BarangKeluar.where("state like 'Lunas' #{query_date}")
                                 .select("DISTINCT sum(grand_total) as nominal")
    end

    respond_to do |format|
      format.xls
    end
  end

  def transaksi_rumah_asi_bjn
    no_transaksi = params[:no_transaksi] ? params[:no_transaksi].upcase : ""
    start_date = params[:start_date] ? params[:start_date] : ""
    end_date = params[:end_date] ? params[:end_date] : ""

    if start_date == "" or end_date == ""
      query_date = nil
    else
      query_date = "AND CAST(barang_keluars.tgl_keluar as DATE) BETWEEN '#{start_date}' AND '#{end_date}'"
    end

    if query_date != nil
      @barang_keluars = BarangKeluar.where("UPPER(barang_keluars.no_transaksi) like '%#{no_transaksi}%'
                                            AND state like 'Lunas'
                                            #{query_date}")
                                    .order("barang_keluars.no_transaksi DESC")
                                    .page(params[:page])
    end

    respond_to do |format|
      format.xls
    end
  end
end
