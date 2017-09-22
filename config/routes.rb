Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :edit, :create, :update]
  root 'groups#index'

end
