class CartsController < ApplicationController

  def show
    @current_cart = Cart.find_by(id: params[:id])
    # binding.pry
  end

  def checkout
    @current_cart = Cart.find_by(id: params[:id])
    @current_cart.status = "submitted"
    @current_cart.save
    @current_cart.items.each do |i|
      b = LineItem.find_by(id: i.id)
      i.inventory = i.inventory - b.quantity
      i.save
    end
    # binding.pry
    current_user.current_cart = nil
    redirect_to cart_path(@current_cart)
  end

end
