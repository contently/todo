Rails.application.routes.draw do
  root to: "tasks#index"
  get "/tasks/completed", to: "tasks#completed"

  resources :session, only: [:new, :create, :destroy]
  resources :tasks
  resources :users, only: [:new, :create, :show]
  resources :lists
end
