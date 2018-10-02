Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks
  resources :users, only: [:create]
  resource :session, only: [:create, :destroy, :show]
end
