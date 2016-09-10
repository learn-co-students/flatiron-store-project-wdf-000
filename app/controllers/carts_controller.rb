class CartsController < ApplicationController

  def show 
    @cart = current_user.current_cart 
  end
  
  def checkout
    if user_signed_in?
      @cart = Cart.find_by(id: params[:id])
      @cart.checkout
      current_user.current_cart_id = nil
      current_user.save
      return redirect_to cart_path(@cart)
    end
  end
end
