class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :carts
  has_many :orders, through: :carts

  def current_cart=(cart)
  	if cart != nil
  		self.current_cart_id = cart.id
      self.save
  	end
  	cart
  end

  def current_cart
    # Cart.create(user_id: self.id)
  	Cart.find_by(id: self.current_cart_id)
  end
end
