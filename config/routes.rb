Rails.application.routes.draw do
  root to: "tasks#index"
  get "/tasks/completed", to: "tasks#completed"

  resource :session, only: [:new, :create, :destroy]
  resources :tasks do
    resources :versions, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show]
  resources :lists
end
