Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  root to: 'events#index'
  resources :events do
    resources :approvals, only: [:index, :create, :edit, :update]
    resources :pre_comments, only: [:index, :create]
    resources :before_comments, only: [:index, :create]
    resources :participations, only: [:index, :create, :edit, :update]
    resources :after_comments, only: [:index, :create]
  end
end
