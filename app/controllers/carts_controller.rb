class CartsController < ApplicationController
  before_action :set_category, only: [:show]

  def show
  end

  private

  def set_category
    @cart = Cart.find(params[:id])
  end
end
