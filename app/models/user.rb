class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable,
  #        :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :validatable
  has_many :carts

  def current_cart=(cart)
    cart.status = "current" unless cart.nil?
  end

  def current_cart
    Cart.find_by(user_id: self.id, status: "current")
  end

end
