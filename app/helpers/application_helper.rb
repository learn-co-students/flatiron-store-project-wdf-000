module ApplicationHelper
  def current_cart
    current_user.current_cart unless current_user.nil?
  end
end
