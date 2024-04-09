class CartController < ApplicationController
  def create
    product_id = params[:product_id]
    session[:cart] ||= Hash.new(0)  # Initialize session[:cart] as an empty hash if it doesn't exist
    session[:cart][product_id] ||= 0  # Initialize the quantity of the product in the cart if it doesn't exist
    session[:cart][product_id] += 1  # Increment the quantity of the product in the cart
    logger.debug("Product #{product_id} added to cart. Cart contents: #{session[:cart]}")

    redirect_to added_to_cart_path  # Redirect to the added_to_cart view
  end

  def destroy
    # Add code for removing a product from the cart
  end

  # Optional: If you're building an API and don't need an HTML view
  def index
    # Add code to fetch cart items
    cart_items = session[:cart] || {}
    render json: cart_items
  end
end
