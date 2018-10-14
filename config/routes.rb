# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'lists#index'
  resources :users
  resources :lists do
    resources :tasks, except: [:index]
  end
  resource :session, only: [:new, :create, :destroy]
end
