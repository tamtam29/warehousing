Rails.application.routes.draw do
  root to: 'dashboards#index'
  devise_for :users
  resources :users
  resources :categories
  resources :dashboards

end
