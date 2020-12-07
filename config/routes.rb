# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # TODO: separate tasks index for all completed tasks and audit trail.

  # Represents a nested resource
  resources :lists do
    # TODO: task history entries
    resources :tasks
  end

  root to: 'lists#index'
end
