class ChargesController < ApplicationController
	before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_plan

  def new
    @plans = { "value1" => 1, "value2" => 2 }
  end

  def thanks
  end

  def create
    # @plan = params[:selected_plan]
    # Amount in cents
    @mens_small = 2999
    @womens_small = 2999

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
    )

    # subscription = Stripe::Plan.create(
    #   usage_type: 'licensed',
    #   currency: 'usd',
    #   interval: 'month',
    #   product: 'prod_Djx54WxAITEwES',
    #   nickname: 'Pro Plan',
    #   amount: 3000,
    # )

    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @mens_small,
    #   :description => 'Mens Small one off',
    #   :currency    => 'usd'
    # )
s
    subscription = Stripe::Subscription.create(
      :customer => customer.id,
      :plan => "plan_Djx6Gwr5kXOFPq"
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