class CartsController < ApplicationController
	before_action :authenticate_user!
	
	def show
		@cart = Cart.find(params[:id])
	end

	def checkout
		cart = Cart.find(params[:id])
		cart.line_items.each do |line_item|
			item = Item.find(line_item.item_id)
			item.inventory -= line_item.quantity
			item.save
		end

		cart.status = 'submitted'
		cart.save

		current_user.current_cart = nil
		current_user.save

		redirect_to cart_path(cart)
	end
end
