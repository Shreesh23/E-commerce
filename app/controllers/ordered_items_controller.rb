class OrderedItemsController < ApplicationController
  def index
    @OrderedItems = OrderedItem.all
  end
end
