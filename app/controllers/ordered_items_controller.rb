# frozen_string_literal: true

class OrderedItemsController < ApplicationController
  def index
    @electronics = Electronic.find(params[:id])
  end

  def electronics
    electronics = Electronic.find(params[:id])
    @add_to_cart = AddToCart.create(name: electronics.name, price: electronics.price, rating: electronics.rating,
                                    user_id: current_user.id)

    redirect_to(controller: 'users', action: 'index')
  end

  def cloth
    clothes = Cloth.find(params[:id])
    @add_to_cloth = AddToCart.create(name: clothes.name, price: clothes.price, rating: clothes.rating,
                                     user_id: current_user.id)
    redirect_to(controller: 'users', action: 'index')
  end

  def footwear
    footwears = Footwear.find(params[:id])
    @add_to_footwear = AddToCart.create(name: footwears.name, price: footwears.price, rating: footwears.rating,
                                        user_id: current_user.id)
    redirect_to(controller: 'users', action: 'index')
  end

  def grocery
    groceries = Grocery.find(params[:id])
    @add_to_grocery = AddToCart.create(name: groceries.name, price: groceries.price, rating: groceries.rating,
                                       user_id: current_user.id)
    redirect_to(controller: 'users', action: 'index')
  end

  def beauty
    beauties = Beauty.find(params[:id])
    @add_to_beauty = AddToCart.create(name: beauties.name, price: beauties.price, rating: beauties.rating,
                                      user_id: current_user.id)
    redirect_to(controller: 'users', action: 'index')
  end

  def book
    books = Book.find(params[:id])
    @add_to_book = AddToCart.create(name: books.name, price: books.price, rating: books.rating,
                                    user_id: current_user.id)
    redirect_to(controller: 'users', action: 'index')
  end

  def mycart
    @addtocart = AddToCart.where(user_id: current_user.id)
  rescue StandardError
    redirect_to(controller: 'users', action: 'index')
  end

  def destroy
    cart = AddToCart.find(params[:id])
    cart.delete
    redirect_to action: 'mycart'
  end
end
