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

      # CrudNotificationMailer.create_notification(@item).deliver_later
      redirect_to users_path

    else

      render :new, status: :unprocessable_entity

    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.delete
    # CrudNotificationMailer.delete_notification(@item). deliver_now

    redirect_to(controller: :users, action: :show)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)

      # CrudNotificationMailer.update_notification(@item).deliver_later

      redirect_to(controller: :users, action: :show)
    else

      render :edit, status: :unprocessable_entity

    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :rating)
  end
end
