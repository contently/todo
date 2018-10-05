# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists
  resources :histories
  root to: 'lists#index'
  resources :tasks
end
