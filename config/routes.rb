Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'welcome', to: 'pages#welcome'
  get 'custom_welcome/:first_name', to: 'pages#welcome', as: 'custom_welcome'
  get 'gossips/:id', to: 'gossips#show', as: 'gossip'


   # Routes for gossips
   resources :gossips

   # Routes for users (if using Devise or similar)
   resources :users, only: [:show, :new, :create]

  root 'pages#home'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
