# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        items = Item.all
        render json: items
      end

      def show
        items = Item.all
        render json: items
      end

      def create
        item = Item.create(item_params)
        render(json: { message: 'ITEM CREATED' })
      end

      def destroy
        @item = Item.find(params[:id])
        @item.destroy
        render(json: { message: 'ITEM DELETED' })
      end

      def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        render(json: { message: 'ITEM UPDATED' })
      end

      private

      def item_params
        params.require(:item).permit(:name, :price, :rating, :user_id)
      end
    end
  end
end
