Rails.application.routes.draw do
  
  root to: 'application#root'
  resources :tasks
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :new]
  delete '/logout', to: 'sessions#destroy'

end
