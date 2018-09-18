Rails.application.routes.draw do
  root to: "tasks#index"
  get "/tasks/completed", to: "tasks#completed"

  resources :session, only: [:create, :destroy]
  resources :tasks
  resources :users, only: [:create, :show]
  resources :lists
end
