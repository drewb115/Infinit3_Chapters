# app/mailers/order_mailer.rb
class OrderMailer < ApplicationMailer
  def confirmation_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Order Confirmation')
  end
end