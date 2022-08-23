Rails.application.routes.draw do
  
  get 'checkout/new'
  get 'checkout/create'
  devise_for :admins
  # get 'admin/index'
  devise_for :users
root 'welcome#index'
  resources :users
  resources :admin
  resources :products
  resources :categories
  resources :cartproducts
  resources :orders
  resources :carts
  # get 'product_by_category/:id', to: 'products#product_by_category'
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  # for payment gateway
  resources :checkouts
  get '/productByCategory/:id', to: 'products#productByCategory', as: 'category_product'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
