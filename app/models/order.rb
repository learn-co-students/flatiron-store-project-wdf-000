class Order < ActiveRecord::Base
  has_many :items through: :order_items
end
