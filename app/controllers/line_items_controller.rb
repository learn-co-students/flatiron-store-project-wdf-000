class LineItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.current_cart = current_user.carts.first_or_create(user_id: current_user.id)
    current_user.save
    current_cart = current_user.current_cart
    line_item = current_cart.add_item(params[:item_id])
    line_item.save
    redirect_to cart_path(current_cart)
  end
end
