class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_one :user, foreign_key: "current_cart_id"


  def total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.item.price * line_item.quantity
    end
    sum
  end

  def add_item(item_id)

    if line_item = line_items.find_by(item_id: item_id)
      line_item.quantity += 1
    else
      line_item = line_items.build(item_id: item_id)
    end
    line_item
  end

  def checkout
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    user.current_cart_id = nil
    user.save
  end
end
