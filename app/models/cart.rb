class Cart < ActiveRecord::Base
  belongs_to :user # fk user_id
  has_many :line_items
  has_many :items, through: :line_items

  def total
    items.map(&:price).reduce(:+)
  end

  def add_item(item_id)
    # LineItem.where(cart: self, item_id: item_id).first_or_initialize
    new_line_item = LineItem.find_or_initialize_by(cart: self, item_id: item_id)
    self.line_items << new_line_item
  end

  def update_inventory
    line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
  end

end
