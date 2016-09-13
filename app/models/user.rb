class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders

  def current_cart
    Cart.find_by(user_id: id)
  end

  def current_cart=(cart)
    cart ? cart.user_id = id : current_cart.update(user_id: nil) if current_cart
  end
end