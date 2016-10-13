class CartsController < ApplicationController
  before_action :authenticate_user!
  def show

  end

  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.checkout
    session[:checkout] = true
    redirect_to cart_path(cart)
  end


end
