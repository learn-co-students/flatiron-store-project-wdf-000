class CartsController < ApplicationController

  def show
    @user = current_user
  end

  def checkout
    current_user.current_cart.checkout
    current_user.current_cart.destroy
    redirect_to cart_path(current_user.current_cart)
  end

end
