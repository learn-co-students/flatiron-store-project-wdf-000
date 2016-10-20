class LineItemsController < ApplicationController
  # def create
  #   @item = Item.find_by_id(params[:item_id])
  #   @user = current_user
  #
  #   if !@user.current_cart
  #     @cart = Cart.create
  #     @line_item = LineItem.create(item_id: @item.id, cart_id: @cart.id)
  #     @cart.line_items << @line_item
  #     @cart.save
  #   else
  #     @cart = @user.current_cart
  #     yes = false
  #     @cart.line_items.each do |line_item|
  #       if line_item.item_id == @item.id
  #         yes = true
  #       end
  #     end
  #     if !yes
  #       @line_item = LineItem.create(item_id: @item.id, cart_id: @cart.id)
  #       @cart.line_items << @line_item
  #       @cart.save
  #     else
  #       @cart.line_items[0].quantity += 1
  #       @cat.line_items[0].save
  #       @cart.save
  #     end
  #   end
  #   @user.current_cart = @cart
  #
  #   redirect_to cart_path(@cart)
  # end

  def create
   # binding.pry
     @user = current_user
   if !@user.current_cart
     @user.current_cart = Cart.create
     @user.current_cart.add_item(params[:item_id]).save
     redirect_to cart_path(@user.current_cart.id)

   else
     @user.current_cart.add_item(params[:item_id]).save
     redirect_to cart_path(@user.current_cart.id)
   end
 end
 
end
