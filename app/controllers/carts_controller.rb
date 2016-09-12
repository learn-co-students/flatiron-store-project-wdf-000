class CartsController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = current_user
	end

	def checkout
		@user = current_user
		current_user.current_cart.checkout
		redirect_to @cart
	end
end
