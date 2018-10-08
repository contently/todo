# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'lists#index'
  devise_for :users
  resources :lists
  resources :lists do
    resources :tasks, shallow: true
    # Custom completed route for tasks.
    resources :tasks do
      collection do
        get 'completed'
      end
    end
  end
end
