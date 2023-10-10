Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  root to: 'events#index'
  resources :events do
    resources :approvals, only: [:index, :create, :edit, :update]
  end
end
