# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        users = User.all
        render json: users
      end

      def show
        users = User.all
        render json: users
      end

      def create
        user = User.create(users_params)
        render(json: { message: 'User Created' })
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render(json: { message: 'User Deleted' })
      end

      def update
        @user = User.find(params[:id])
        @user.update(users_params)
        render(json: { message: 'USER UPDATED' })
      end

      private

      def users_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
