# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    respond_to do |format|
      format.html
      format.csv { send_data Item.to_csv, filename: "items-#{DateTime.now.strftime('%d%m%Y%H%M')}.csv" }
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # CreateJob.set(wait: 1.minutes).perform_later(@item)
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    # DeleteJob.perform_later(@item)
    redirect_to(controller: :items, action: :index)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      # UpdateJob.perform_later(@item)
      redirect_to(controller: :items, action: :index)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :rating, :user_id)
  end
end
