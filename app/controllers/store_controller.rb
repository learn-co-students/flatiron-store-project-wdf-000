class StoreController < ApplicationController
  def index
    @user = User.first
    @categories = Category.all
    @items = Item.all

  end
end
