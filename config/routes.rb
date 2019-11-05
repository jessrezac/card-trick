Rails.application.routes.draw do

  root to: "welcome#home"

  resources :users
  resources :stacks do
    resources :cards, only: [:index, :show, :new, :create]
  end
  resources :cards, only: [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get "/files", to: "files#index"
  get "/picker", to: "files#picker"
  post "/files", to: "files#create"
  get "/login", to: "sessions#new"
  post "/logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create_from_google"

end
