class User < ActiveRecord::Base
  has_many :carts
  has_many :orders
  # belongs_to :current_cart, class_name: "Cart"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def current_cart=(cart)
  if cart
    self.current_cart_id = cart.id
  else
    self.current_cart_id = nil
  end
end

def current_cart
  Cart.find_by(id: self.current_cart_id)
end

end
