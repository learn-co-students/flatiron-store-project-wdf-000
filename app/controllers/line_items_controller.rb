class LineItemsController < ApplicationController
  def create
    if user_signed_in?
      current_user.current_cart = current_user.carts.new unless current_cart.present?
      current_user.save
      current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_cart)
    else
      redirect_to store_path
    end
  end

end
