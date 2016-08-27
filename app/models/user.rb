class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders

  def current_cart=(arg)
    if !arg.nil?
      self.update(current_cart_id:arg.id)
    end
    arg
  end

  def current_cart
    Cart.find_by(id:current_cart_id)
  end

end
