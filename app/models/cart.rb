class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_one :user, foreign_key: "current_cart_id"

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item_id)
    item = Item.find_by(id: item_id)
    line_item = item.line_items.find_by(cart_id: self.id)
    if line_item.nil?
      new_line_item = item.line_items.build(quantity: 1, cart_id: self.id, item_id: item_id)
    else
      quantity = line_item.quantity + 1
      line_item.update(quantity: quantity)
      line_item
    end
  end
end
