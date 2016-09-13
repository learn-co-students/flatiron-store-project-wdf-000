class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :categories, through: :items
  has_many :orders


  def total
    line_items.map{|line_item| line_item.total}.reduce(:+)
    # prices = [0]
    # line_items.map do |line_item|
    #   line_item.quantity.times do 
    #     prices << Item.find_by(id: line_item.item_id).price
    #   end
    # end
    # prices.reduce(:+)
  end

  def add_item(item_id)
    LineItem.find_or_initialize_by(item_id: item_id, cart_id: self.id)
  end

  def quantity(item)
    line_items.find_by(item_id: item.id).quantity
  end

  def checkout
    items.each do |item|
      item.update(inventory: item.inventory - quantity(item))
    end
    update(status: "submitted", user_id: nil)
    save
  end
end
