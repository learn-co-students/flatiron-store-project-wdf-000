class CartsController < ApplicationController

  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.checkout
    # current_user.update(current_cart_id: nil)
    redirect_to cart_path(cart)
  end

  def show
    @cart = Cart.find_by(id: params[:id])
  end



end
