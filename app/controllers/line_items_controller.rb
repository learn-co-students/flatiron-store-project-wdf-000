class LineItemsController < ApplicationController

  def create
    if current_user.current_cart
      cart = current_user.current_cart
    else cart = Cart.new
    end
    cart.add_item(params[:item_id])
    cart.save
    current_user.current_cart = cart
    redirect_to cart_path(current_user.current_cart)
  end


end
