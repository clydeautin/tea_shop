class CustomerSubscriptionSerializer
  include JSONAPI::Serializer

  attributes :customer_id, :subscription_id, :start_date, :end_date
  
end