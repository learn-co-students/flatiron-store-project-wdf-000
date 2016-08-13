class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.map(&:price).reduce(:+)
  end

  def add_item(item_id) 
    if line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1

    else
      # line_item = LineItem.new(cart_id: self.id, item_id: item_id, quantity: 1)
      line_item = self.line_items.build(item_id: item_id, quantity: 1)
    end
    line_item
  end

  def checkout
    self.line_items.each do |line_item| 
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end

    # self.status = "submitted"
    self.status = "nil"

    self.user.current_cart_id = -1
    self.user.save
    self.save
  end
end
