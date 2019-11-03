Rails.application.routes.draw do

  root to: "welcome#home"

  resources :users
  resources :cards
  resources :stacks do
    resources :cards, only: [:index, :show]
  end
  resources :sessions, only: [:new, :create, :destroy]

  get "/login", to: "sessions#new"
  post "/logout", to: "sessions#destroy"
  
end
