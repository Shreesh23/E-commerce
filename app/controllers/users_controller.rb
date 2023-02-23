# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @electronics = Electronic.all
    @groceries = Grocery.all
    @footwears = Footwear.all
    @clothes = Cloth.all
    @books = Book.all
    @beauties = Beauty.all
  end

  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @item.save
      # CreateJob.perform_later(@user)
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @User = User.find(params[:id])

    @User.delete
    # DeleteJob.perform_later(@user)
    redirect_to(controller: :users, action: :show)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # UpdateJob.perform_later(@user)
      redirect_to users_url, notice: 'Successfully Updated'
    else
      render :edit, status: unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end
end
