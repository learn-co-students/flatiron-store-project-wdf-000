class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, :through => :line_items
  



  def total
    total_price = 0
    self.items.each do |item|
      total_price += item.price
    end
    total_price
  end

  def add_item(item)
    @line_item = LineItem.find_by(item_id: item)
    if @line_item
      @line_item.quantity += 1
    else
      @line_item = LineItem.new(cart_id: self.id, item_id: item)
    end
    @line_item

  end

end
