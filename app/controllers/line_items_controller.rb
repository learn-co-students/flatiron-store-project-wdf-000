class LineItemsController < ApplicationController
  def create
    if !cart = current_user.current_cart
      cart = Cart.create(user_id: current_user.id)
      current_user.current_cart = cart
      current_user.save
    end
    line_item = cart.add_item(params[:item_id])
    line_item.save
    redirect_to cart
  end
end
