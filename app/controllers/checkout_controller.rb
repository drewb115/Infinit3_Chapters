class CheckoutController < ApplicationController
  def create
    product = Book.find(params[:product_id])
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: product.title,
          },
          unit_amount: (product.price * 100).to_i,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: product_purchases_url(product) + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: product_url(product),
    })

    render json: { client_secret: session.client_secret }
  end
end