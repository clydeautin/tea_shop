# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'factory_bot_rails'
require 'faker'

# Clear existing data

Tea.destroy_all
Customer.destroy_all
Subscription.destroy_all
SubscriptionTea.destroy_all
CustomerSubscription.destroy_all


cus1 = FactoryBot.create(:customer)
cus2 = FactoryBot.create(:customer)
cus3 = FactoryBot.create(:customer)
cus4= FactoryBot.create(:customer)
cus5 = FactoryBot.create(:customer)


tea1 = Tea.create!(title: "Green Tea", 
                    description: "Green tea is a type of tea that is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.", 
                    temperature: 180, 
                    brew_time: 3)
tea2 = Tea.create!(title: "Black Tea",
                    description: "Black tea is a type of tea that is more oxidized than oolong, green, and white teas. Black tea is generally stronger in flavor than other teas.",
                    temperature: 212,
                    brew_time: 5)
tea3 = Tea.create!(title: "Oolong Tea",
                    description: "Oolong is a traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting.",
                    temperature: 190,
                    brew_time: 4)
tea4 = Tea.create!(title: "White Tea",
                    description: "White tea is a style of tea which dates back to the Tang Dynasty (618-907 AD). It is the least processed of all the teas.",
                    temperature: 185,
                    brew_time: 2)
tea5 = Tea.create!(title: "Herbal Tea",
                    description: "Herbal tea, or tisane, is any beverage made from the infusion or decoction of herbs, spices, or other plant material in hot water.",
                    temperature: 200,
                    brew_time: 5)

sub1 = Subscription.create!(title: "Tea of the Month", price: 20, status: 1, frequency: 30)
sub2 = Subscription.create!(title: "Tea of the Week", price: 10, status: 1, frequency: 7)
sub3 = Subscription.create!(title: "Tea of the Day", price: 5, status: 1, frequency: 1)


sub_tea1 = SubscriptionTea.create!(subscription_id: sub1.id, tea_id: tea1.id)
sub_tea2 = SubscriptionTea.create!(subscription_id: sub1.id, tea_id: tea2.id)
sub_tea3 = SubscriptionTea.create!(subscription_id: sub1.id, tea_id: tea3.id)

sub_tea4 = SubscriptionTea.create!(subscription_id: sub2.id, tea_id: tea4.id)
sub_tea5 = SubscriptionTea.create!(subscription_id: sub3.id, tea_id: tea5.id)

CustomerSubscription.create!(customer_id: cus1.id, subscription_id: sub1.id, start_date: "2022-01-01", end_date: "2022-01-31")
CustomerSubscription.create!(customer_id: cus2.id, subscription_id: sub1.id, start_date: "2022-01-01", end_date: "2023-01-31")
CustomerSubscription.create!(customer_id: cus3.id, subscription_id: sub2.id, start_date: "2022-01-01", end_date: "2024-01-31")

