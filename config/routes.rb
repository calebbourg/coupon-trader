Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  	  post 'user_token' => 'user_token#create'
      resources :users, only: [:create]
      post '/users/update_balance', to: 'users#update_balance'
      resources :coupons, only: [:create, :index] do
        resources :transactions, only: [:create]
      end
    end
  end
end
