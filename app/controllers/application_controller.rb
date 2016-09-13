class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # def current_cart
  #     # byebug
  #   @current_cart = current_user.current_cart
  # end
end
