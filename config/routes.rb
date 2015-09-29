Rails.application.routes.draw do
  resources :tasks
  resources :lists
  resources :items
end
