Rails.application.routes.draw do
  root to: 'transactions#index'

  devise_for :users

  get 'transactions/index'
end
