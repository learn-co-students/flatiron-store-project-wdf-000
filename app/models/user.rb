class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: "Cart"

  # def current_cart
  #   Cart.find_by(id: self.current_cart_id)
  # end

  # def current_cart=(cart)
  #   self.current_cart_id = cart.try(:id)
  #   self.save
  #   cart
  # end

  def create_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    self.save
  end

  def remove_cart
    self.current_cart_id = nil
    self.save
  end

end
