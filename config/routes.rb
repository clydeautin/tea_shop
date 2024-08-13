Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      post '/customers', to: 'customers#create'
      delete '/customers/:id', to: 'customers#destroy'
      get '/customers/:id', to: 'customers#show'
      get '/customers/:id/subscriptions', to: 'customer_subscriptions#index'

      post '/customer_subscriptions', to: 'customer_subscriptions#create'
      patch '/customer_subscriptions/:id', to: 'customer_subscriptions#update'
    end
  end
end
