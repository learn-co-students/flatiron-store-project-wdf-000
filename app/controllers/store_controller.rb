class StoreController < ApplicationController
  def index
  	@categories = Category.all
  	@items = Item.all

  	if current_user
  		@current_cart = current_user.current_cart
  	else
  		@current_cart = nil
  	end

  end
end
