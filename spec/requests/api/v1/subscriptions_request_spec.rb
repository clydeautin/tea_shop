require 'rails_helper'

RSpec.describe 'Subscriptions API' do
  it 'Can create a subscription' do
    cus1 = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane@email.com', address: '123 Main St')
    sub1 = Subscription.create!(title: 'Subscription 1', price: 10.00, status: 'active', frequency: 1)

    post '/api/v1/customer_subscriptions', params: { customer_id: cus1.id, subscription_id: sub1.id }

    expect(response).to have_http_status(:created)
    json = JSON.parse(response.body, symbolize_names: true)

    created_subscription = CustomerSubscription.last
    expect(created_subscription.customer_id).to eq(cus1.id)
    expect(created_subscription.subscription_id).to eq(sub1.id)
  end

  it 'Can cancel a subscription' do
    cus1 = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane@email.com', address: '123 Main St')
    sub1 = Subscription.create!(title: 'Subscription 1', price: 10.00, status: 'active', frequency: 1)
    cs1 = CustomerSubscription.create!(customer: cus1, subscription: sub1, start_date: Date.today, end_date: Date.today >> 1)

    patch "/api/v1/customer_subscriptions/#{cs1.id}"

    expect(response).to have_http_status(:ok)
    expect(cs1.reload.end_date).to eq(Date.today)

  end

  it 'Can show all the subscriptions for a customer' do
    cus1 = Customer.create!(first_name: 'Jane', last_name: 'Doe', email: 'jane@email.com', address: '123 Main St')
    sub1 = Subscription.create!(title: 'Subscription 1', price: 10.00, status: 'active', frequency: 1)
    sub2 = Subscription.create!(title: 'Subscription 2', price: 15.00, status: 'active', frequency: 2)
    cs1 = CustomerSubscription.create!(customer: cus1, subscription: sub1, start_date: Date.today, end_date: Date.today >> 1)
    cs2 = CustomerSubscription.create!(customer: cus1, subscription: sub2, start_date: Date.today, end_date: Date.today >> 1)

    get "/api/v1/customers/#{cus1.id}/subscriptions"
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:ok)
    expect(json[:data].count).to eq(2)
    expect(json[:data].first[:attributes][:title]).to eq(sub1.title)
  end
end