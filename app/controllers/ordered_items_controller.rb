# frozen_string_literal: true

class OrderedItemsController < ApplicationController
  def index
    @OrderedItems = OrderedItem.all
  end
end
