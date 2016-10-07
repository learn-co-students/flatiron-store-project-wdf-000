class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    items.map do |item|
      li = self.line_items.find {|li| li.item_id == item.id}
      total += (item.price * li.quantity)
    end
    total
  end

  def add_item(item_id)
    li = LineItem.find_or_initialize_by(cart_id: id, item_id: item_id)
  end

  def update_inventory
    line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
  end
end
