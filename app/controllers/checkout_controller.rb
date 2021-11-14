class CheckoutController < ApplicationController

  def create
  	user = User.find(params[:id])
  	@session = Stripe::Checkout::Session.create({
	  payment_method_types: ['card'],
	  line_items: [{
	  	name:user.user_name,
	  	amount: 999,
	  	currency:"usd",
	  	quantity:1,
	  }],
	  mode: 'payment',
	  success_url: edit_user_registration_path,
	  cancel_url: edit_user_registration_path,
	})

	respond_to do |format|
	  format.js
	end
  end

  def sucess
  end

  def failure
  end

end
