class CartsController < ApplicationController
  def show
   @cart = Cart.find_by_id(params[:id])
  end

  def checkout
    @cart = Cart.find_by_id(params[:id])
    @cart.checkout
    current_user.update(current_cart_id: nil)
    redirect_to cart_path(@cart)
  end

end
