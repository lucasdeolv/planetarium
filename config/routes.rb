Rails.application.routes.draw do
  devise_for :users
  resources :planets
  resources :transactions, only: %i[new create show]
  get 'root_url', to: 'home#index'
end
