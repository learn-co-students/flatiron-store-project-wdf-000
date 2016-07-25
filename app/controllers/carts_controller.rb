class CartsController < ApplicationController
  def show
  end

  def checkout
    cart = Cart.find(params[:id])
    cart.checkout
    session[:cart_id] = nil
    redirect_to cart_path(cart)
  end
end
