# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        orders = Order.all
        render json: orders
      end

      def show
        orders = Order.all
        render json: orders
      end

      def create
        order = Order.create(orders_params)
        render(json: { message: 'ORDER CREATED' })
      end

      def destroy
        order = Order.find(params[:id])
        order.destroy
        render(json: { message: 'ORDER DELETED' })
      end

      def update
        @order = Order.find(params[:id])
        @order.update(orders_params)
        render(json: { message: 'ORDER UPDATED' })
      end

      private

      def orders_params
        params.require(:order).permit(:name, :total_price, :user_id)
      end
    end
  end
end
