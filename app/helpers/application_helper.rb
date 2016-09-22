module ApplicationHelper
  def current_cart
    current_user.current_cart unless current_user.nil?
  end

  def last_cart
    current_user.carts.last unless current_user.carts.empty?
  end
end
