Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'store_data_auth' => 'coordinator_auth#store_data'
  post 'store_data_user' => 'coordinator_users#store_data'
end
