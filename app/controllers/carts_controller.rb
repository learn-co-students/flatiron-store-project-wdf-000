class CartsController < ApplicationController
  def checkout
    cart = Cart.find(params[:id])
    cart.items.each do |item|
      item.update_inventory(cart)
    end
    cart.update(status: "submitted")
    redirect_to cart_path(cart)
  end
end
