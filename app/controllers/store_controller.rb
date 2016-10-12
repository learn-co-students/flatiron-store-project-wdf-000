class StoreController < ApplicationController

  def index
    # binding.pry
    @categories = Category.all
    @items = Item.all.find_all {|item| item.inventory > 0}

  end
end
