class LineItemsController < ApplicationController
  def create
    # find or create the cart using current_user
    cart = current_user.current_cart || Cart.create(user_id: current_user.id)
    
    # find the line_item associated with teh item_id givin in the param
    line_item = LineItem.find_by(item_id: params[:item_id], cart_id: cart.id)
    
    if line_item
      line_item.quantity += 1
      line_item.save
    else # create a brand new LineItem entry
      LineItem.create(item_id: params[:item_id], cart_id: cart.id)
    end

    redirect_to cart_path(cart)
  end
end
