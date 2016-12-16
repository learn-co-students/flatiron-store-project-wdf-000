class CartsController < ApplicationController

  def show
    Cart.find(params[:id])
  end

  def checkout
    cart = current_cart
    cart.checking_out
    redirect_to cart_path(cart)
  end
end
