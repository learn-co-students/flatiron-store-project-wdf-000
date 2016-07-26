module CartsHelper
  def notice
    "Your cart is empty." if !current_cart || current_cart.total == 0
  end
end
