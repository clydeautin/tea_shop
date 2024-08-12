class CustomerSubscription < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :customer
  belongs_to :subscription
end