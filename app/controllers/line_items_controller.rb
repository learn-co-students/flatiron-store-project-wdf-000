class LineItemsController < ApplicationController

  def create
    unless current_user
      flash[:message] = 'You need to Sign in'
      redirect_to new_user_session_path
    else
      current_cart = Cart.find_or_create_by(user_id: current_user.id)
      current_user.current_cart = current_cart
      current_user.save

      current_cart.add_item(params[:item_id])
      current_cart.save

      redirect_to current_cart
    end
  end

end
