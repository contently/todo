Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
