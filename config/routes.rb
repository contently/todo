Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks

  # Custom routes added for link_to filter buttons
  match 'completed' => 'tasks#completed', via: :get, as: :tasks_completed
  match 'all' => 'tasks#all', via: :get, as: :tasks_all

end
