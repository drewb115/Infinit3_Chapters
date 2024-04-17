Rails.application.routes.draw do
  # Routes for Devise User Authentication (regular users)
  devise_for :users

  # Custom sign-out route
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Routes for Active Admin (AdminUser)
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Route for the About page - make sure it doesn't conflict with 'home#about'
  # If 'home#about' is a different page, keep it, else remove it.
  # get 'about', to: 'home#about'

  get 'added_to_cart', to: 'cart#added_to_cart'

  # Route for viewing individual book pages and listing books
  resources :books, only: [:show, :index]

  # Route for health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Assuming page_contents is not being used, otherwise set up the proper controller and action
  # resources :page_contents, only: [:show]

  # Routes for the CartController
  resources :cart, only: [:create, :destroy, :index, :update]

  # Define the root path route ("/")
  root "home#index"

  # Route for the About Us page with defaults
  # This should be your route for the "About Us" button
  get '/about_us', to: 'pages#show', as: :about_us_page

  # Define custom routes for checkout actions
  resources :products do
    resources :purchases, only: [:create]
  end

  # Any other custom routes go here
end
