class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
        #  :recoverable, :validatable
  enum role: [:guest, :user, :admin]

  has_many :carts
  has_many :orders
  has_many :items, through: :orders
  belongs_to :current_cart, class_name: :Cart

end
