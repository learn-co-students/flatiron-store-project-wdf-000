class LineItemsController < ApplicationController
  
  def create
    item = Item.find_by(:id => params[:item_id])
    current_user.add_to_cart(item)
    redirect_to cart_path(@current_user.current_cart)
  end

end
