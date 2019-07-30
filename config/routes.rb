Rails.application.routes.draw do
  resources :order_items
  resources :cuisines, only: [:index, :show]
  resources :restaurants
  resources :items
  resources :orders
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
