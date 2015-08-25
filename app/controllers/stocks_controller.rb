class StocksController < ApplicationController
  load_and_authorize_resource
  def index
    query = params[:name] ? params[:name].downcase : ""
    @stocks = Stock.joins(:barang)
                   .where("(lower(barangs.code) like '%#{query}%' OR
                            lower(barangs.name) like '%#{query}%')")
                   .order("barangs.code ASC")
                   .page(params[:page])
  end

  def show
    @stock = Stock.joins(barang: :unit).find(params[:id])
  end
end
