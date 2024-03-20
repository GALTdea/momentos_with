Rails.application.routes.draw do

  resources :quiz_sessions do
    member do
      get 'start'
    end
    resources :answers, only: [:create]
  end

  resources :answers, only: [:create]

  resources :questions do
    member do
      patch :toggle_status
    end
  end

  resources :quizzes do
    resources :questions
    resources :quiz_sessions
    member do
      post :add_questions
    end
  end

  devise_for :users

  authenticated :user do
    root 'quizzes#index', as: :authenticated_root
  end

  root "quizzes#index"

  resources :entries

  resources :children do
    resources :entries, only: [:create, :destroy, :new, :show, :edit, :update]
  end

  resources :users do
    resources :children
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

end
