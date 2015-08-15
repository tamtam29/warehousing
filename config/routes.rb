Rails.application.routes.draw do
  root to: 'dashboards#index'
  devise_for :users
  resources :users
  resources :dashboards
  resources :units
  resources :categories
  resources :barangs
  resources :stocks
  resources :barang_masuks

end
