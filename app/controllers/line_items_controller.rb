class LineItemsController < ApplicationController
  def create
    # assign cart unless already assigned
    current_user.create_cart unless current_user.current_cart
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart.id), notice: 'Item added to cart!'
    else
      redirect_to store_path, alert: 'Item not added'
    end
    # raise 'stop'.inspect
    # redirect_to cart_path(current_user.current_cart.id)
  end
end
