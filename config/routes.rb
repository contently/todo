# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists
  devise_for :users
  root to: 'lists#index'
  resources :tasks
end
