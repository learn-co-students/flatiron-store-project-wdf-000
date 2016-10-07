class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    cart_total = 0
    self.line_items.each do |li|
      cart_total += (li.item.price * li.quantity)
   end
   cart_total
  end

  def add_item(id)
    line_item = line_items.find_by(item_id: id)
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.new(item_id: id)
    end
    line_item
  end

end
