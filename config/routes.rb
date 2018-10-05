# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists
  resources :histories
  root to: 'tasks#index'
  resources :tasks
end
