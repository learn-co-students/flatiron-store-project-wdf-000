class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    self.line_items.map{|l_i| l_i.item.price * l_i.quantity}.reduce(:+)
  end

  def add_item(item)
    line_item = self.line_items.where(item: item).first
    if line_item
      line_item.quantity += 1
      line_item.save
    else line_item = self.line_items.build(item_id: item)
    end
    line_item
  end

  def checkout
    self.line_items.each do |l_i|
      l_i.item.inventory -= l_i.quantity
      l_i.item.save
    end
  end

end
