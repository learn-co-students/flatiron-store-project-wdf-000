class LineItemsController < ApplicationController
  def create
    # binding.pry
    @cart = current_user.current_cart
    if @cart.nil?
      @cart = current_user.current_cart = Cart.create(user_id:current_user.id)
    end
    @cart.add_item(params[:item_id].to_i)
    redirect_to cart_path(@cart)
  end 

end
