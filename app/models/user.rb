class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts



  def current_cart=(cart)
    if !cart.nil?
      cart = Cart.find_or_create_by(id: cart.id)
      self.current_cart_id = cart.id
    end

  end



  def current_cart
    Cart.find_by(id: self.current_cart_id)
  end


  #getter just returns the vaiable if it exits if not it returns nil








































end
