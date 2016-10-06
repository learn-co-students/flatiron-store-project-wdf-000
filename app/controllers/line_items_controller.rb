class LineItemsController < ApplicationController

  def create
    if !current_user.current_cart
      current_user.current_cart = Cart.create(user_id: current_user.id)
    end
    # current_user.current_cart.add_item(params[:item_id])
    item = Item.find(params[:item_id]) 
    if current_user.current_cart.items.include?(item)
      line_item = LineItem.find_by(cart: current_user.current_cart, item: item)
      line_item.quantity += 1
      line_item.save
    else
      current_user.current_cart.items << item
    end
    current_user.save

    redirect_to cart_path(current_user.current_cart)
  end

end
