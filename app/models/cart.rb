class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  def total
    total_cart = 0
    self.line_items.each do |line_item|
      total_cart = total_cart + line_item.quantity * line_item.item.price.to_f 
    end
    
    return total_cart.round(2)
  end

  def add_item(item_id)
    item = Item.find_by(:id => item_id)
    if self.items.include?(item)
     line_item = LineItem.find_by(:cart_id => self.id, :item_id => item_id)
     line_item.quantity = line_item.quantity + 1
     line_item.save
     line_item
    else
      self.items << item
      new_line_item = LineItem.new(:item_id => item_id, :cart_id => self.id, :quantity => 1)
    end
  end
  
  def checkout
    self.line_items.each do |line_item|
      item = Item.find_by(:id => line_item.item_id)
      item.inventory = item.inventory - line_item.quantity
      item.save
    end
    self.user.current_cart_id = nil
    self.user.save
  end
end

