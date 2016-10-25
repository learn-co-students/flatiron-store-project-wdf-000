module ApplicationHelper

  def number_to_currency(price)
    "$#{price.to_f/100}"
  end

  def current_cart
    if session[:checkout]
      Cart.find_by(id: params[:id])
    else
      current_user.try(:current_cart)
    end
  end
end
