class CartsController < ApplicationController

  def show
    if user_signed_in?
      current_user_cart
    end
  end

  def checkout
    current_user_cart.checking_out
    current_user_cart.checked_out
    redirect_to cart_path(current_user_cart), notice: "Order submitted"
  end

  private
end
