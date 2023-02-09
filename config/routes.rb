Rails.application.routes.draw do
  get 'items/index'
  
  root "users#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :orders
  resources :ordered_items
  resources :users
  
  get "users/sign_in"
  get "users/products"
  resources :items
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
