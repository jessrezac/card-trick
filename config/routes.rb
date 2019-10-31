Rails.application.routes.draw do
  get "/", to: "welcome#home"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get "/login", to: "sessions#new"
  post "/logout", to: "sessions#destroy"
end
