class CartsController < ApplicationController
  def show
    @user = current_user

  end

  def checkout
    @current_cart = Cart.find(params[:id])
    @current_cart.checkout


    redirect_to cart_path(@current_cart)
    

  end
end
