class CartsController < ApplicationController
  before_action :set_category, only: [:show, :checkout]

  def show
  end

  def checkout
    @cart.checkout
    redirect_to cart_path(@cart)
  end

  private

  def set_category
    @cart = Cart.find(params[:id])
  end
end
