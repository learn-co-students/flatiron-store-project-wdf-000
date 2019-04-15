class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    self.all.select do |item|
      if item.inventory != 0
        item
      end
    end
  end


end
