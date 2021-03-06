Rails.application.routes.draw do

  root to: "welcome#home"

  resources :users
  resources :stacks do
    resources :cards, only: [:index, :show, :new, :create]
  end
  resources :cards, only: [:edit, :update, :destroy]
  resources :imports, only: [:new, :create]
  resources :attempts, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]

  get "/login", to: "sessions#new"
  post "/logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create_from_google"

end
