module ApplicationHelper

  def current_user_cart
    current_user.current_cart if user_signed_in?
  end

end
