class LineItemsController < ApplicationController
  def create

    if current_user
      
      current_user.current_cart = current_user.carts.create unless !current_user.current_cart.nil?
      

      current_user.save

      current_user.current_cart.add_item(params[:item_id]).save
      # current_user.save
				

      # binding.pry
      redirect_to cart_path(current_user.carts.last)
    else
      flash[:message] = "You must be logged in"
      redirect_to store_path
    end
  
   
  end
end
