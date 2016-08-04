class LineItemsController < ApplicationController
	def create
		current_cart = current_user.current_cart
		cart = nil

		if current_cart
			cart = current_cart
		else
			cart = Cart.create(user_id: current_user.id)
			current_user.current_cart = cart
			current_user.save
		end
		
		old_line_item = LineItem.find_by(item_id: params[:item_id]) rescue nil

		if old_line_item
			old_line_item.quantity += 1
			old_line_item.save
		else
			LineItem.create(item_id: params[:item_id], cart_id: cart.id)
		end

		
		redirect_to cart_path(current_user.current_cart)
	end
end
