class CartsController < ApplicationController

  def show
    if user_signed_in?
      current_cart
    end
  end

  def checkout
    current_cart.checking_out
<<<<<<< HEAD
    current_cart.checked_out
=======
>>>>>>> 00262675e0bb3c0d7741c1c857f52bf19a96762f
    redirect_to cart_path(current_cart), notice: "Order submitted"
  end

  private
end
