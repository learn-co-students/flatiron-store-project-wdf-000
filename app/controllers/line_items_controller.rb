class LineItemsController < ApplicationController
  def create
    cart = current_user.current_cart || Cart.create(user_id: current_user.id)
    line_item = LineItem.find_by(item_id: params[:item_id], cart_id: cart.id)
    if line_item
      line_item.quantity += 1
      line_item.save
    else
      line_item = LineItem.create(item_id: params[:item_id], cart_id: cart.id)
    end
    redirect_to cart_path(cart)
  end
end
