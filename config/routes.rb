# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tasks#index', completed: "incompleted"
  resources :tasks, except: :index
  get "/tasks", to: 'tasks#index', completed: "incompleted"
  get "/tasks/index/:completed", to: "tasks#index", as: "tasks_index"
end
