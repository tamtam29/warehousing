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

  get "report_barang_masuk" => "reports#report_barang_masuk", :as => :report_barang_masuk
  get "report_barang_masuk/:id" => "reports#show_report_barang_masuk", :as => :show_report_barang_masuk
end
