class Cart < ActiveRecord::Base
  belongs_to :user # fk user_id
  has_many :line_items
  has_many :items, through: :line_items

  def total
    items.map(&:price).reduce(:+)
  end

  def add_item(item_id)
    # LineItem.where(cart: self, item_id: item_id).first_or_initialize
    LineItem.find_or_initialize_by(cart: self, item_id: item_id)
  end

end
