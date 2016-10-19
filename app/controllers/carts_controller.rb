class CartsController < ApplicationController
  before_action :current_cart






  def checkout
    @current_cart.line_items.each do |line|     #line_item.inventory =
      line.item.inventory -= line.quantity     #a computer always reads a number as a
      line.item.save                            #it never saves a math equation
    end
        @current_cart.status = "submitted"
        @current_cart.save
        current_user.current_cart_id = nil
        current_user.current_cart = nil
        current_user.save
        redirect_to cart_path(@current_cart)
  end




  def add_to_cart


  end


  def show
    @current_cart = Cart.find_by(id: params[:id])

  end






  private

  def current_cart
    @current_cart = Cart.find_by(id: params[:id])
  end




end
