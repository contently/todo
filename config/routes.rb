# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  # index, create, new, edit, show, update, destroy
  get '/lists(?=:incomplete)', to: 'lists#index', as: :lists
  resources :lists, only: [:new, :create, :show] do
    resources :tasks, only: [:new, :create, :show, :index, :edit, :update]
  end
end
