class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    # assign cart unless already assigned
    current_user.current_cart = @cart unless current_user.current_cart
    @cart.line_items << @cart.add_item(params[:item_id])
    redirect_to cart_path(@cart.id)
  end
end
