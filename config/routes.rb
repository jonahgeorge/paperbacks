Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  root to: "pages#index"
  get "/search" => "search#index"
  devise_for :users

  resources :books, only: [:index, :show]
  resources :listings, only: [:index, :new, :create]
  resources :users, only: [:show]
end
