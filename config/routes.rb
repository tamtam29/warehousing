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
end
