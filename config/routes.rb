# frozen_string_literal: true
require 'sidekiq/web'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :items
      resources :orders
    end
  end
  mount Sidekiq::Web => '/sidekiq'
  post 'items/create'
  get 'items/index'
  root 'users#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'electronics/:id', to: 'ordered_items#electronics'
  get 'cloth/:id', to: 'ordered_items#cloth'
  get 'footwear/:id', to: 'ordered_items#footwear'
  get 'grocery/:id', to: 'ordered_items#grocery'
  get 'beauty/:id', to: 'ordered_items#beauty'
  get 'book/:id', to: 'ordered_items#book'
  get 'destroy/:id', to: 'ordered_items#destroy'
  get 'cartitem/:id', to: 'orders#cartitem'
  get 'myorders/', to: 'orders#myorders'
  get 'mycart', to: 'ordered_items#mycart'
  resources :orders
  resources :ordered_items
  resources :users

  get 'users/sign_in'
  get 'users/products'
  resources :items
  get 'index/:id', to: 'orders#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
