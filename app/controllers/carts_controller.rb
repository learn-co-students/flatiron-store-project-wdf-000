class CartsController < ApplicationController
  def show
    @cart = current_user.current_cart
  end

  def checkout
    @cart = Cart.find_by(id:params[:id])
    @cart.status = "submitted"
    # binding.pry
    @cart.line_items.each do |x|
      x.item.inventory -= (1*x.quantity)
      x.item.save
    end
    @cart.save
    current_user.current_cart_id = nil
    current_user.save
    redirect_to cart_path(@cart)
  end
end
