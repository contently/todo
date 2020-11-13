# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  # index, create, new, edit, show, update, destroy
  # get '/lists(?=complete:incomplete)', to: 'lists#index', as: :lists
  # get '/lists/'
  resources :lists, only: [:index, :new, :create, :show] do
    resources :tasks, only: [:new, :create, :show, :index, :edit, :update]
  end
end
