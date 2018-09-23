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
    @mens_small = 2499

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @mens_small,
      :description => 'Mens Small',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  private

	def amount_to_be_charged
	  @amount = 500
	end

	def set_plan
    @plan = "bronze"
  end
end