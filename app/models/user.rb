class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts

  def current_cart
    Cart.find_by(id: self.current_cart_id)
  end

  def current_cart=(cart)
    if cart != nil 
      self.current_cart_id = cart.id
      self.save
    end
  end

  def add_to_cart(item)
    self.current_cart ||= Cart.create
    self.current_cart.add_item(item.id)
    self.save
  end
end
