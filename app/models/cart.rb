class Cart < ActiveRecord::Base
  belongs_to :user # fk user_id
  has_many :line_items
  has_many :items, through: :line_items

  def total
    # items.map(&:price).reduce(:+)

    total = 0
    items.map do |item|
      li = self.line_items.find {|li| li.item_id == item.id}
      total += (item.price * li.quantity)
    end
    total
  end

  def add_item(item_id)
    # LineItem.where(cart: self, item_id: item_id).first_or_initialize
    new_line_item = LineItem.find_or_initialize_by(cart: self, item_id: item_id)
  end

  def update_inventory_and_status
    line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    update_status
  end

  def update_status
    self.status = 'submitted'
  end

end
