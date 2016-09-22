class CartsController < ApplicationController
  def checkout
    cart = Cart.find(params[:id])
    cart.items.each do |item|
      item.update_inventory(cart)
    end
    cart.update(status: "submitted")
    flash[:message] = "Your order has been submitted"
    current_user.update(current_cart: nil)

    redirect_to cart_path(cart)
  end
end
