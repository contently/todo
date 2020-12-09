# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks do
    post '/complete', to: 'tasks#complete', via: :post
  end
  resources :lists, only: [:new, :create]
end
