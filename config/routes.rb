# frozen_string_literal: true

Rails.application.routes.draw do
  resources :task_lists
  devise_for :users
  root to: 'task_lists#index'
  resources :tasks
end
