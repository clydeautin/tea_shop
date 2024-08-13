class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = Subscription.find(params[:subscription_id])

    customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription, start_date: Date.today, end_date: Date.today >> 1)
    if customer_subscription.save
      render json: CustomerSubscriptionSerializer.new(customer_subscription), status: :created
    else
      render json: { errors: customer_subscription.errors.full_messages }, status: :bad_request
    end
  end

  def update
    customer_subscription = CustomerSubscription.find(params[:id])
    if customer_subscription.update(end_date: Date.today)
      render json: CustomerSubscriptionSerializer.new(customer_subscription), status: :ok
    else
      render json: { errors: customer_subscription.errors.full_messages }, status: :bad_request
    end
  end

  def index

    customer = Customer.find(params[:id])
    subscriptions = customer.subscriptions

    render json: SubscriptionSerializer.new(subscriptions)
  end
end