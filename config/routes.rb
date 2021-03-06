Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
  root 'groups#index'

end
