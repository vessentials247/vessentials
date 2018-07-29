class ChargesController < ApplicationController
	before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_plan

  def new
  end

  def thanks
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # def create
  #   if params[:subscription].include? 'yes'
  #     StripeTool.create_membership(email: params[:stripeEmail], 
  #                                  stripe_token: params[:stripeToken],
  #                                  plan: @plan)
  #   else
  #     customer = StripeTool.create_customer(email: params[:stripeEmail], 
  #                                           stripe_token: params[:stripeToken])
  #     charge = StripeTool.create_charge(customer_id: customer.id, 
  #                                     amount: @amount,
  #                                     description: @description)
  #   end

  #   redirect_to thanks_path
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end

  private

	def amount_to_be_charged
	  @amount = 500
	end

	def set_plan
    @plan = "bronze"
  end
end