class LineItemsController < ApplicationController
  def create
    if !current_user.current_cart
      current_user.current_cart = Cart.create(user_id: current_user.id)
    end
    item = Item.find(params[:item_id])
    if current_user.current_cart.items.include?(item)
      li = LineItem.find_by(cart: current_user.current_cart, item: item)
      li.quantity += 1
      li.save
    else
      current_user.current_cart.items << item
    end
    current_user.save
    redirect_to cart_path(current_user.current_cart)
  end

end
