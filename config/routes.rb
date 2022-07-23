Rails.application.routes.draw do
  devise_for :users
  resources :planets
  resources :transactions, only: %i[new create show]
  root to: 'planets#index'
end
