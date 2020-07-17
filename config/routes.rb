Rails.application.routes.draw do
  devise_for :users
  
  root to: 'tasks#index'

  resources :users, only: [:show]

  resources :tasks

  resource :profile

  resources :todos
end
