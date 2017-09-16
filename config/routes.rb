Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :edit
  root 'messages#index'

end
