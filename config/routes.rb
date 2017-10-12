Rails.application.routes.draw do
  devise_for :users
  root controller: :restaurants, action: :index
  resources :restaurants
  resources :dishes
  resources :carts do
    get :remove_item
  end
  get '/add_to_cart/:id', controller: :carts, action: :add, as: :add_to_cart
end
