class CheckoutController < ApplicationController
  before_action :authenticate_user!, only: [:thank_you]

  # Other actions...

  def create
    # Process the checkout request here

    # Simulate successful payment
    payment_successful = true

    if payment_successful
      # Get the book details
      @book = Book.find(params[:book_id])

      # Redirect the user to the thank you page along with book details
      redirect_to thank_you_path(book_id: @book.id)
    else
      # Handle the case where payment is not successful
      # You can render an error message or redirect to a different page
    end
  end

  def confirm_order
    # This action will render the "Ordered Confirm" view
  end

  def thank_you
    # Retrieve the book details using the ID passed in the parameters
    @book = Book.find(params[:book_id])

    # Access user details
    @user = current_user

    # Calculate taxes based on user's province and book price
    @tax_rate = @user.tax_rate
    @tax_amount = @book.price * @tax_rate
  end
end
