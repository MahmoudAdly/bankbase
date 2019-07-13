Rails.application.routes.draw do
  root to: 'transactions#index'

  devise_for :users

  resources :transactions, only: [:new, :create]
end
