class CartController < ApplicationController
  def create
    product_id = params[:product_id]
    session[:cart] ||= Hash.new(0)
    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1
    flash[:notice] = "Product #{product_id} added to cart."
    redirect_to added_to_cart_path
  end

  def update
    product_id = params[:id]
    new_quantity = params[:quantity].to_i

    if session[:cart] && session[:cart].has_key?(product_id)
      if new_quantity > 0
        session[:cart][product_id] = new_quantity
        flash[:notice] = "Quantity updated for Product #{product_id}."
      else
        session[:cart].delete(product_id)
        flash[:notice] = "Product #{product_id} removed from cart."
      end
    else
      flash[:alert] = "Product #{product_id} not found in cart."
    end

    redirect_to cart_path
  end

  def destroy
    product_id = params[:id]

    if session[:cart] && session[:cart].has_key?(product_id)
      session[:cart].delete(product_id)
      flash[:notice] = "Product #{product_id} removed from cart."
    else
      flash[:alert] = "Product #{product_id} not found in cart."
    end

    redirect_to cart_path
  end

  def index
    @cart_items = session[:cart] || {}
    @books_in_cart = Book.where(id: @cart_items.keys)
  end
end
