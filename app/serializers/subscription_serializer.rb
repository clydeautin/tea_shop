class SubscriptionSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :title
  attribute :price
  attribute :status
  attribute :frequency
  attribute :created_at
  attribute :updated_at

end
