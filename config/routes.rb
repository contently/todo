Rails.application.routes.draw do
  devise_for :users

  root to: "lists#index"
  get 'lists/audit_log', to: 'lists#audit_log'
  resources :lists do
    resources :tasks
  end
end
