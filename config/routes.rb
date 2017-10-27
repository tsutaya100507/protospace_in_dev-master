Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show, :edit, :update, :delete]
  end

end
