class LineItemsController < ApplicationController

  def create
    # binding.pry
    if current_user.current_cart.nil?
      a = current_user.carts.create(user_id: current_user.id)
      current_user.current_cart = a
      current_user.save
    end
    if c = current_user.current_cart.line_items.find_by(item_id: params[:item_id])
      c.quantity += 1
      c.save
      redirect_to cart_path(current_user.current_cart)
    else
      line_item = LineItem.create(item_id: params[:item_id])
      # binding.pry
      current_user.current_cart.line_items << line_item
      redirect_to cart_path(current_user.current_cart)
    end
  end

end
