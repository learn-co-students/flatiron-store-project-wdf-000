class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :current_cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def current_cart
    # return carts.last unless !carts.last || carts.last.status == "submitted"
    return carts.last unless !carts.last || carts.last.status == "nil"
    # return carts.last unless !carts.last 
    nil
  end

  def current_cart=(cart)
    if cart == nil && !carts.empty?
      self.current_cart_id = -1
      
    else
      super
    end
  end
end
