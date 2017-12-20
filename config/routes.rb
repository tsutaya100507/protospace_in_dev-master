Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :comments, only: [:create]
  end

  # resources :prototypes, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show, :edit, :update, :delete]

end
