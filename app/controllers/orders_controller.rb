# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :confirmation]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # Create associated order items
      params[:book_ids].each do |book_id|
        book = Book.find(book_id)
        @order.order_items.create(book_id: book_id, quantity: 1, price: book.price)
      end

      redirect_to order_confirmation_path(@order)
    else
      render :new
    end
  end

  def confirmation
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :customer_email, :address_line1, :address_line2, :city, :province, :postal_code)
  end
end


