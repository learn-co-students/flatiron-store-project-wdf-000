class LineItemsController < ApplicationController
  def create
<<<<<<< HEAD
    if current_user
      current_user.current_cart = current_user.carts.create unless current_user.current_cart
=======
    if user_signed_in?
      current_user.current_cart = current_user.carts.new unless current_user.current_cart
>>>>>>> 00262675e0bb3c0d7741c1c857f52bf19a96762f
      current_user.save
      current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_cart)
    else
      redirect_to store_path
    end
  end

  private
end
