class Order < ActiveRecord::Base
  enum status: [:pending, :shipped]
  has_one :cart
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def ship
    update(status: 1)
  end
end
