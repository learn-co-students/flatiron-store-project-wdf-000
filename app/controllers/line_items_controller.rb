class LineItemsController < ApplicationController
  # def create
  #   @user = current_user
  #   @item = Item.find_by_id(params[:item_id])
  #   if !@user.current_cart
  #     @cart = Cart.create
  #   else
  #     @cart = @user.current_cart
  #   end
  #   @line_item = LineItem.create(item_id:@item.id, cart_id:@cart.id)
  #   @user.current_cart = @cart
  #   @cart.add_item(params[:item_id]).save
  #
  #   redirect_to cart_path(@cart)
  #
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
