class OrdersController < ApplicationController
  before_action :set_order only: [:show]

  def show
  end

  def shipped
    self.shipping
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :cart_id)
  end
end
