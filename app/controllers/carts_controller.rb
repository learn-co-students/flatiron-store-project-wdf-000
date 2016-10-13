class CartsController < ApplicationController

  # before_action :authenticate_user

  def new
   @cart = Cart.new
 end


  def show
    # current_cart
    @cart = current_user.current_cart
    # binding.pry

  end

  def checkout
   @cart = Cart.find_by(id: params[:id])
   @cart.status = 'submitted'
     @cart.line_items.each do |li|
       li.item.inventory -= li.quantity
       li.item.save
     end

   @cart.save
   @cart.user.current_cart = nil
   @cart.user.save
   redirect_to cart_path(@cart)
  end


end
