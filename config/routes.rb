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


  get 'added_to_cart', to: 'cart#added_to_cart'

  # Route for viewing individual book pages and listing books
  resources :books, only: [:show, :index]

  # Route for health check
  get "up" => "rails/health#show", as: :rails_health_check

   # Route for checkout form
   get "/checkout", to: "checkout#new"
   post "/checkout", to: "checkout#create"
   post "checkout/create", to: "checkout#create", as: "checkout_create"

   # Route for thank you page
   get "/thank_you", to: "checkout#thank_you"

   get '/order_confirm', to: 'confirmation#index'

  # Define the root path route ("/")
  root "home#index"

end
