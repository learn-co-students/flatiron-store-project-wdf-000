class User < ActiveRecord::Base
  has_many :carts
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_cart=(cart)
    cart ? current_cart_id = cart.id : current_cart.update(user_id: nil) if current_cart
  end

  def current_cart
    Cart.find_by(user_id: id)
  end

  # def remove_cart
  #   self.current_cart_id = nil
  #   save
  # end


end
