class LineItemsController < ApplicationController
  def create
    if !current_cart
      new_cart = current_user.carts.create
      session[:cart_id] = new_cart.id
    end
    line_item = current_cart.add_item(params[:item_id])
    line_item.save
    redirect_to '/'
  end
end
