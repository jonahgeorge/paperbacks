Rails.application.routes.draw do
  root to: "home#index"

  get "/confirm" => "email_confirmation#show"
  get "/signup" => "users#new"
  post "/signup" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  get "/search" => "search#index"

  resources :books
  resources :listings, except: [:index]
  resources :users, only: [:show]
end
