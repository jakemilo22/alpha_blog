Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # call pages_controller - home method / action
  root 'pages#home'
  
  # call using 'get' request to about page
  get 'about', to: 'pages#about'

  # resources - accesses app/controllers/articles_controller.rb - from Section 4.84 - 4.86 - Show Articles
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] -- this shows all routes for resources
  resources :articles   # resources without options - will use all available routes

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]
end
