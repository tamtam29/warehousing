class StocksController < ApplicationController
  def index
    @stocks = Stock.page(params[:page])
  end

  def show
    @stock = Stock.joins(barang: :unit).find(params[:id])
  end
end
