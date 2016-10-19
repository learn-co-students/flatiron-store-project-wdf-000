class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    arr = []
    self.line_items.map do |line_item|
      num  = line_item.quantity * line_item.item.price
      arr << num

    end
    arr.sum
  end


  def add_item(item_id)
    LineItem.find_or_initialize_by(cart_id: self.id, item_id: item_id)
  end






end
