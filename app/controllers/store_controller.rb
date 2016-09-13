class StoreController < ApplicationController
  skip_filter :authenticate_user!
  def index
    @items = Item.available_items
    @categories = Category.all
  end
end
