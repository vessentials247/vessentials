class ChargesController < ApplicationController
	before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_plan

  def new
  end

  def thanks
  end

  def create
    if params[:selected_plan_male].blank? && params[:selected_plan_female].blank?
      response = { "error" => "Ooops! Don't forget to select a plan..." }
      render json: response, status: :bad_request
      return
    end

    @selected_plan = params[:selected_plan_male] || params[:selected_plan_female]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
    )

    subscription = Stripe::Subscription.create(
      :customer => customer.id,
      :plan => @selected_plan
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