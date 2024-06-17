Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "users#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :destroy] do
        resources :orders, only: [:index, :create, :show, :destroy]
      end        
      resources :products, only: [:index, :create, :show, :update, :destroy]
    end
  end
end


# do
#         resources :orders, only: [:index, :create, :show, :destroy] do
#           resources :order_items, [:index, :create, :show, :destroy]
#           resources :payments, [:index, :create, :show, :destroy]
#         end
#       end