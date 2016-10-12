class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  # attr_accessor :current_cart
  has_many :orders

  def current_cart
    Cart.find_by(user_id: self.id)
  end

  def current_cart=(cart)
    if cart
      cart.user_id = self.id
    else
      current_cart.update(user_id: nil) if current_cart
    end
  end


end
