Rails.application.routes.draw do
  # HW4: tasks are now nested under lists
  resources :lists, except: :show do
    resources :tasks
  end

  # HW4: list/show automatically shows tasks
  get 'lists/:list_id', to: redirect('/lists/%{list_id}/tasks'), constraints: { :list_id => /\d+/ }

  # HW5: add our users paths
  resources :users
  post 'login/:id', to: "users#login"
  post 'logout', to: "users#logout"

  root to: "users#index"
end