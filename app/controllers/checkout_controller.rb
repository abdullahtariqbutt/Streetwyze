class CheckoutController < ApplicationController
  before_action :find_user, only: %i[create]

  def create
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name:user.user_name,
        amount: 999,
        currency:"usd",
        quantity:1,
      }],
      client_reference_id: user.id,

      mode: 'payment',
      success_url: edit_user_registration_url,
      cancel_url: edit_user_registration_url,
    })

    respond_to do |format|
      format.js
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
