Rails.application.routes.draw do
  root to: 'stocks#index'
  devise_for :users
  resources :users
  resources :dashboards
  resources :units
  resources :categories
  resources :barangs
  resources :promos
  resources :stocks
  resources :barang_masuks
  resources :barang_keluars
  resources :detail_barang_keluars
  resources :reports
  resources :pre_orders

  # reports
  get "report_pemasukan" => "reports#report_pemasukan", :as => :report_pemasukan
  get "pemasukan_rumah_asi_bjn" => "reports#pemasukan_rumah_asi_bjn", :as => :pemasukan_rumah_asi_bjn
  get "report_barang_masuk" => "reports#report_barang_masuk", :as => :report_barang_masuk
  get "report_barang_masuk/:id" => "reports#show_report_barang_masuk", :as => :show_report_barang_masuk
  get "transaksi_rumah_asi_bjn" => "reports#transaksi_rumah_asi_bjn", :as => :transaksi_rumah_asi_bjn

  # pre_orders
  get "pre_orders/:pre_order_id/form_bayar_po" => "pre_orders#form_bayar_po", :as => :form_bayar_po
  post "pre_orders/:pre_order_id/bayar_po" => "pre_orders#bayar_po", :as => :bayar_po
  get "pre_orders/:pre_order_id/show_bayar_po" => "pre_orders#show_bayar_po", :as => :show_bayar_po

  # stock
  get "stock_barang_rumah_asi_bjn" => "stocks#stock_barang_rumah_asi_bjn", :as => :stock_barang_rumah_asi_bjn
end
