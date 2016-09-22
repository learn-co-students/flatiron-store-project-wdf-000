class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def format_price
  end

  def self.available_items
    Item.where("inventory > 0")
  end

  def update_inventory(cart)
    purchase = cart.line_items.detect{|item| item.item_id == self.id}
    remain = self.inventory - purchase.quantity
    self.update(inventory: remain)
  end

end
