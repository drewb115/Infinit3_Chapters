Rails.application.routes.draw do
  # Routes for Devise User Authentication (regular users)
  devise_for :users

  # Routes for Active Admin (AdminUser)
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Route for the About page
  get 'about', to: 'home#about'

  get 'added_to_cart', to: 'cart#added_to_cart'

  # Route for viewing individual book pages and listing books
  resources :books, only: [:show, :index]

  # Route for health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes for the CartController
  resources :cart, only: [:create, :destroy, :index]

  # Define the root path route ("/")
  root "home#index"
end
