class StoreController < ApplicationController
  skip_filter :authenticate_user!
  def index
    @categories = Category.all
    @items = Item.available_items
  end

end
