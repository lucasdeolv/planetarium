Rails.application.routes.draw do
  devise_for :users
  resources :planets
  resources :orders, only: %i[new create show]
  root to: 'planets#index'
end
