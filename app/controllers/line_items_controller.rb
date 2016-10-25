class LineItemsController < ApplicationController
  def create
      @cart = current_user.current_cart
      if !@cart 
        @cart = Cart.create(user_id: current_user.id)   
         current_user.current_cart_id = @cart.id
         current_user.save
        # binding.pry
        # current_user.current_cart = current_user.carts.create
    end 
      line_item = @cart.add_item(params[:item_id])
      line_item.save
      redirect_to @cart
  end

end
