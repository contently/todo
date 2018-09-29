# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#root'
  namespace :api, defaults: {format: :json} do
    resources :tasks
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create, :update, :show]
  end
end
