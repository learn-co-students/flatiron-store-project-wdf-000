class CartsController < ApplicationController

  def show

  end

  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.update_inventory_and_status
    cart.save
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(cart)
  end

end
