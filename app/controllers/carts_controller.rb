class CartsController < ApplicationController

 def show
   @cart = Cart.find_by_id(params[:id])
 end

 def checkout
  #  binding.pry
   @cart = Cart.find_by_id(params[:id])
   @items = @cart.items
   @cart.line_items.each do |line_item|
    @items.each do |item|
      if item.id == line_item.item_id
        item.inventory = item.inventory- line_item.quantity
        item.save
      end
    end
   end


   @cart.user.current_cart.delete
   @cart.user.current_cart

 end

end
