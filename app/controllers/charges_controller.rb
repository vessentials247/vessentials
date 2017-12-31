class ChargesController < ApplicationController
	before_action :authenticate_user!
  before_action :amount_to_be_charged

  def new
  end

  def thanks
  end

	def create
    customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id, 
                                      amount: @amount,
                                      description: @description)

    redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

	def amount_to_be_charged
	  @amount = 500
	end
end