# frozen_string_literal: true

class OrdersController < ApplicationController
  def cartitem
    myorders = AddToCart.find(params[:id])
    order = Myorder.new(name: myorders.name, price: myorders.price, rating: myorders.rating,
                        user_id: current_user.id)
    myorders.destroy if order.save
    redirect_to(controller: 'orders', action: 'myorders')
  end

  def myorders
    @allorders = Myorder.where(user_id: current_user.id)
  end
end
