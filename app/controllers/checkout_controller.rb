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
		 	client_reference_id: user.id,

		  mode: 'payment',
		  success_url: 'http://localhost:3000/users/edit',
		  cancel_url: 'http://localhost:3000/users/edit',
	})

		respond_to do |format|
		  format.js
		end
  end

end
