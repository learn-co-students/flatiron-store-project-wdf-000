class LineItemsController < ApplicationController
  def create
    @cart = Cart.new
    @cart.user_id = current_user.id
    current_user.current_cart = @cart
    @cart.line_items << @cart.add_item(params[:item_id])
    if @cart.save
      redirect_to cart_path(@cart.id)
    end
  end
end
