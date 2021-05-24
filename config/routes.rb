Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "texts#index"
  resources :texts, only: [:index, :show]
  resources :movies, only: [:index]
  resources :questions, only: [:index, :show]
  resources :movies do
    resource :likes, only: [:create, :destroy]
  end

  resources :texts do
    resource :read_progresses, only: [:create, :destroy]
  end
end
