Rails.application.routes.draw do
  root to: "pages#index"
  get "/search" => "search#index"

  get "/confirm" => "email_confirmation#show"
  get "/signup" => "users#new"
  post "/signup" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :books, only: [:index, :show]
  resources :listings, only: [:index]
  resources :users, only: [:show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
