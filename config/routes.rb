Rails.application.routes.draw do
  devise_for :users
  resources :planets do
    resources :orders, only: %i[new create show]
  end
  get "orders", to: "orders#index", as: :orders
  root to: 'planets#index'
end
