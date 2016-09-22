class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #        :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :validatable
  has_many :carts

  def current_cart=(cart)
    cart.nil? ? self.current_cart_id = nil : self.current_cart_id = cart.id #unless cart.nil?
    self.save
  end

  def current_cart
    Cart.find_by(user_id: self.id, id: self.current_cart_id)
  end

end
