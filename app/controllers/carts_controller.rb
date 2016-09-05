class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def checkout
    current_cart = Cart.find(params[:id])
    current_cart.checkout
  end
end
