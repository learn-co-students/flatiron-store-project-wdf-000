class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  attr_reader :is_nil

  def current_cart=(cart)
    if cart != nil
      self.carts << cart
    elsif cart == nil && self.carts.last
      self.carts.last.destroy
    end
    self.save
  end

  def current_cart
    self.carts.last
  end

end
