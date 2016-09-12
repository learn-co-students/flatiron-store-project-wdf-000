require 'pry'
class LineItemsController < ApplicationController
	def create
		if current_user
			if current_user.current_cart
				@cart = current_user.current_cart
				@cart.save
			else 
				current_user.current_cart=(Cart.create(user_id: current_user.id))
				current_user.save
				@cart = current_user.current_cart
			end
			@cart.add_item(params[:item_id])
			@cart.save
			redirect_to @cart
		end
	end
end