class CartController < ApplicationController
  def create
    product_id = params[:product_id]
    session[:cart] ||= Hash.new(0)
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1
    logger.debug("Product #{product_id} added to cart. Cart contents: #{session[:cart]}")

    redirect_to added_to_cart_path
  end

  def update
    product_id = params[:product_id]
    new_quantity = params[:quantity].to_i

    if session[:cart] && session[:cart][product_id]
      if new_quantity > 0
        session[:cart][product_id] = new_quantity
      else
        session[:cart].delete(product_id)
      end
      logger.debug("Product #{product_id} updated in cart. Cart contents: #{session[:cart]}")
    else
      logger.debug("Product #{product_id} not found in cart.")
    end

    redirect_to cart_path  # Assuming you have a view to display the cart
  end

  def destroy
    product_id = params[:product_id]

    if session[:cart] && session[:cart][product_id]
      session[:cart].delete(product_id)
      logger.debug("Product #{product_id} removed from cart. Cart contents: #{session[:cart]}")
    else
      logger.debug("Product #{product_id} not found in cart.")
    end

    redirect_to cart_path  # Redirect back to the cart view
  end

  def index
    cart_items = session[:cart] || {}
    render json: cart_items
  end
end
