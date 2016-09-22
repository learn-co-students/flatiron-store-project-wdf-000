class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.find_by(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end
end
