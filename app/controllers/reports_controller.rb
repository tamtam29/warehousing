class ReportsController < ApplicationController
  def index
    no_transaksi = params[:no_transaksi] ? params[:no_transaksi].upcase : ""
    start_date = params[:start_date] ? params[:start_date] : ""
    end_date = params[:end_date] ? params[:end_date] : ""

    if start_date == "" or end_date == ""
      query_date = nil
    else
      query_date = "AND CAST(barang_keluars.created_at as DATE) BETWEEN '#{start_date}' AND '#{end_date}'"
    end

    @barang_keluars = BarangKeluar.where("UPPER(barang_keluars.no_transaksi) like '%#{no_transaksi}%' #{query_date}").order("barang_keluars.no_transaksi DESC").page(params[:page])
  end

  def show
    @barang_keluar = BarangKeluar.find(params[:id])
  end
end
