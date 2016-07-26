class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  def current_cart=(cart)
    if cart
      cart.user_id = id
    elsif current_cart
      current_cart.update(user_id: nil)
    end 
  end

  def current_cart
    Cart.find_by(user_id: id)
  end
end
