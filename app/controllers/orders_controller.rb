class OrdersController < ApplicationController
  before_action :set_order only: [:show, :ship]

  def show
  end

  def shipped
    @order.ship
  end

  private

  def set_order
    @order = Order.find(order_params)
  end

  def order_params
    params.require(:order).permit(:user_id, :cart_id, :status)
  end
end
