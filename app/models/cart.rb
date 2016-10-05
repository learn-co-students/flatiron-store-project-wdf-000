class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    line_items.collect(&:item).collect(&:price).inject(:+).to_f
  end

  def add_item(item_id)
    line_item = LineItem.find_or_initialize_by(item_id: item_id)
    line_item.cart_id = id unless line_item.cart_id
    line_item
  end
end
