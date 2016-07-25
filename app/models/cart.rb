class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    line_items.inject(0){|total,i| total + i.quantity * i.item.price}
  end

  def add_item(item_id)
    line_item = line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = LineItem.new(cart_id: id, quantity: 1, item_id: item_id)
    end
    line_item
  end

  def checkout
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    update(status: "submitted")
    save
    user.current_cart = nil
  end
end
