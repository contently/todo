# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists
  devise_for :users
  root to: 'tasks#index'
  resources :tasks
  resources :audits, path: 'activity_log', only: :index
end
