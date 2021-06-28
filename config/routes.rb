Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]
  resources :health_checks, only: [:new, :index, :create, :edit, :update] do
    member do
      get :complete
    end
  end
  resources :activity_logs, only: [:new, :index, :create, :edit, :update] do
    member do
      get :complete
    end
  end
end
