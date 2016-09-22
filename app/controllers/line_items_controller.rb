class LineItemsController < ApplicationController

  def create
    current_user.current_cart = current_user.carts.create if current_cart.nil?
    line_item = current_cart.add_item(params[:item_id])
    line_item.save
    current_user.save
    current_cart.save
    # binding.pry
    redirect_to cart_path(current_cart)
  end

end
