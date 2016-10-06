class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    # assign cart unless already assigned
    current_user.current_cart = @cart unless current_user.current_cart
    # why are duplicates not getting created?
    @cart.line_items << @cart.add_item(params[:item_id])

    # does this make sense?
    # line_item = @cart.add_item(params[:item_id])
    # if line_item.new_record?
    #   @cart.line_items << @cart.add_item(params[:item_id])
    # else
    #   @cart.line_items.find(id: line_item.id).update(quatity: line_item.quatity)
    # end

    redirect_to cart_path(@cart.id)
  end
end
