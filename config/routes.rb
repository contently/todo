# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # separate tasks index for all completed tasks and audit trail.
  get 'history', to: 'history#index', as: :history

  # Represents a nested resource
  resources :lists do
    resources :tasks
  end

  root to: 'lists#index'
end
