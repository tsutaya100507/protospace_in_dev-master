Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show, :edit, :update, :delete]
  resources :comments, only: [:create]

end
