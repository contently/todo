Rails.application.routes.draw do
  devise_for :users
  resources :list_items
  resources :lists

  unauthenticated do
   root :to => 'lists#index', as: :unauthenticated_root
 end

  authenticated do
    root :to => 'tasks#not_completed', as: :authenticated_root
  end

  resources :tasks do
    collection do
      get 'completed'
      get 'not_completed'
    end
  end

end
