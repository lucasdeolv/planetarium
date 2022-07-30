Rails.application.routes.draw do
  devise_for :users
  resources :planets do
    resources :orders, only: %i[new create show]
  end
  root to: 'planets#index'
end
