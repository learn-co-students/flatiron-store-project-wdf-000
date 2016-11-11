class CartsController < ApplicationController
  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.checkout
    redirect_to cart_path
  end
end
