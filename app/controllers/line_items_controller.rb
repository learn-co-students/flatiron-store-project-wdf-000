class LineItemsController < ApplicationController



  def create
    if current_user
      @item = Item.find_by(id: params[:item_id])
        if current_user.current_cart.nil?
          cart = Cart.create(user_id: current_user.id)
            current_user.current_cart = cart
              @item.line_items.create(cart_id: cart.id, item_id: @item.id)
              current_user.save

        else
          item = LineItem.find_by(item_id: @item.id, cart_id: current_user.current_cart.id)
          if item
            item.quantity += 1
            item.save
          else
            LineItem.create(item_id: @item.id, cart_id: current_user.current_cart.id)

          end
    end
    redirect_to cart_path(current_user.current_cart)
  end
end






end
