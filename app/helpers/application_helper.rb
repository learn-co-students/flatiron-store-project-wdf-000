module ApplicationHelper
  
  def current_user_cart
    current_user.current_cart
  end

end
