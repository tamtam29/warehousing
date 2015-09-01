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
  get "report_barang_masuk" => "reports#report_barang_masuk", :as => :report_barang_masuk
  get "report_barang_masuk/:id" => "reports#show_report_barang_masuk", :as => :show_report_barang_masuk

  # pre_orders
  get "pre_orders/:pre_order_id/form_bayar_po" => "pre_orders#form_bayar_po", :as => :form_bayar_po
  post "pre_orders/:pre_order_id/bayar_po" => "pre_orders#bayar_po", :as => :bayar_po
  get "pre_orders/:pre_order_id/show_bayar_po" => "pre_orders#show_bayar_po", :as => :show_bayar_po
end
