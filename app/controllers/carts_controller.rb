class CartsController < ApplicationController
  # before_action :current_cart

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = Cart.find_by(id: params[:id])
    @cart.checkout

    current_user.update(current_cart_id: nil)
    redirect_to cart_path(@cart)
  end
end
