Rails.application.routes.draw do
  
  devise_for :admins
  # get 'admin/index'
  devise_for :users
root 'welcome#index'
  resources :users
  resources :admin
  resources :products
  resources :categories
  # get 'product_by_category/:id', to: 'products#product_by_category'

  get '/productByCategory/:id', to: 'products#productByCategory', as: 'category_product'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
