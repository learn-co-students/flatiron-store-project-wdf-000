class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart
  helper_method :current_user


  def index
    @user = current_user
    # binding.pry
    @categories = Category.all
    @items = Item.all
    render "/store/index"
  end




  # private



end
