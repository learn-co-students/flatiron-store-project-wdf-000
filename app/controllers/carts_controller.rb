class CartsController < ApplicationController

  def show
    if user_signed_in?
      current_cart
    end
  end

  def checkout
    current_cart.checking_out
    redirect_to cart_path(current_cart), notice: "Order submitted"
  end
end
