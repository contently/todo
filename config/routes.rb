# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  resources :users
  resources :lists
  resource :session, only: [:new, :create, :destroy]
end
