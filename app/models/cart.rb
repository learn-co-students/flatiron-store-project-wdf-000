class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    self.items.collect{ |item| item.price }.inject(0){ |sum, price| sum + price }
  end

  def add_item(item_number)
    line_item = LineItem.find_by(cart_id: self.id, item_id: item_number)
    if line_item.nil?
      LineItem.new(cart_id: self.id, item_id: item_number)
    else
      quantity = line_item.quantity + 1
      LineItem.update(line_item.id, quantity: quantity)
    end
  end

end
