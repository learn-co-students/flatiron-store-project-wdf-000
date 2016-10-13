class LineItemsController < ApplicationController
  #
  # def create
  #   # binding.pry
  #   # current_user.current_cart.add_item(params[:item_id])
  # end

  def create
    if current_user
      current_user.current_cart = current_user.carts.create unless current_user.current_cart
      current_user.save
      current_user.current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_user.current_cart)
    elsif
      redirect_to store_path
    end
  end

end
