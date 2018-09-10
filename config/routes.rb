Rails.application.routes.draw do
  root to: "home#index"
  resources :users do
    resources :lists do
      resources :tasks do
        get 'mark_complete', :on => :member
      end
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
