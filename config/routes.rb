Rails.application.routes.draw do

  root to: "welcome#home"

  resources :users
  resources :stacks do
    resources :cards, only: [:index, :show, :new, :create]
  end
  resources :cards, only: [:edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]


  get "/login", to: "sessions#new"
  post "/logout", to: "sessions#destroy"
  
end
