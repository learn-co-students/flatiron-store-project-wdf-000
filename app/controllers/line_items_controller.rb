class LineItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.create_current_cart unless current_user.current_cart
    current_cart = current_user.current_cart
    line_item = current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end
  end
end
