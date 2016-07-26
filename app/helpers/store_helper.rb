module StoreHelper
  def current_cart
    Cart.find_by(id: session[:cart_id])
  end
end
