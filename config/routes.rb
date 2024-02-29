Rails.application.routes.draw do
  get 'entries/create'

  devise_for :users

  resources :children do
    resources :entries, only: [:create, :destroy, :new, :show] # You can adjust the actions as needed
  end

  resources :users do
    resources :children
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
end
