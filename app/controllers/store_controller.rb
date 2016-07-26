class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.available_items
    if current_user && current_user.current_cart
      @cart = current_user.current_cart
    end
    @user = current_user
  end
end
