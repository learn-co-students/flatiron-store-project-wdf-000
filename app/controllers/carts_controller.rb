class CartsController < ApplicationController
  before_action :authenticate_user!
  def show

  end

  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    session[:checkout] = true
    current_user.current_cart = nil
    current_user.save

    redirect_to cart_path(cart)
  end


end
