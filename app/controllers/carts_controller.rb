class CartsController < ApplicationController

   def checkout
    cart = Cart.find_by(id: params[:id])
    # @user = cart.user
    cart.checkout
     @user = cart.user
    session[:checkout] = true
    # binding.pry
    redirect_to cart_path(cart)
  end

end
