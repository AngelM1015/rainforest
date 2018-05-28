Rails.application.routes.draw do
  resources :our_services
  resources :abouts
  resources :homes
  resources :carts
  resources :cart_items, only: [:create, :destroy]
  resources :reviews
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
