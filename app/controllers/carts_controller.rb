class CartsController < ApplicationController

def new
  @cart = Cart.new
end

# def create
#   current_user.current_cart = Cart.new(user_id: current_user.id)
#   line_item = LineItem.find_by(item_id: params[:item_id])
#   @cart.line_items << line_item
#   @cart.save
# end

def show
 @cart = current_user.current_cart
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
