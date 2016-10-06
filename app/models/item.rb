class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    all.where('inventory > 0')
  end

  def update_inventory(num)
    update(inventory: inventory - num)
  end
end
