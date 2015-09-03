class StocksController < ApplicationController
  load_and_authorize_resource
  def index
    query = params[:name] ? params[:name].downcase : ""
    if query != ""
      @stocks = Stock.joins(:barang)
                     .where("(lower(barangs.code) like '%#{query}%' OR
                              lower(barangs.name) like '%#{query}%')")
                     .order("barangs.code ASC")
                     .page(params[:page]).per(12)
    else
      @stocks = Stock.where("id = 0").page(params[:page])
    end
  end

  def show
    @stock = Stock.joins(barang: :unit).find(params[:id])
  end

  def stock_barang_rumah_asi_bjn
    @stocks = Stock.joins(:barang).order("barangs.code ASC")
    respond_to do |format|
      format.xls
    end
  end
end
