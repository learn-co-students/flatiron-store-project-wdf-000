class Order < ActiveRecord::Base
  enum status: [:pending, :shipped]
  has_one :cart
  delegate :user, to: :cart
  has_many :line_items
  has_many :items, through: :line_items

  def ship
    self.update(status: 1)
  end
end
