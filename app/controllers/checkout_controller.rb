class CheckoutController < ApplicationController

  def create
    # establish a connection to Stripe and then redirect the user to the payment screen
    product = Product.find_by(id: params[:product_id])

    if product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          currency: 'cad',
          product_data: {
            name: product.name,
            description: product.description
          },
          unit_amount: product.price_cents,
          tax_rates: ['tax_rate_id'] # Replace 'tax_rate_id' with your actual tax rate ID
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: 'https://example.com/success?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'https://example.com/cancel',
      automatic_tax: { enabled: true }, # Only if you want to use Stripe's automatic tax calculation
    )

    # You can redirect the user to the Stripe Checkout page or return the session ID to your front end
    # Example: redirect to the Stripe Checkout page
    redirect_to @session.url, allow_other_host: true
  end

end
