class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :categories, through: :items
  has_many :orders

  def total
    t = 0
    self.items.each do |item|
      line_item = LineItem.find_by(item: item)
      quantity = line_item.quantity
      quantity.times {t += item.price}
    end
    t
  end

  def add_item(item_id)
    line_item = LineItem.find_or_initialize_by(item_id: item_id, cart: self)
    # line_item.quantity += 1
    # line_item.save
  end

  def checkout
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    update(status: "submitted", user_id: nil)
  end

end
