class Cart < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def total
    # binding.pry
    self.line_items.map do |l|
      l.item.price * l.quantity
    end.inject(0, :+)
  end

  def add_item(i)
    item = Item.find_by(id: i)
    # binding.pry
    if self.items.include?(item)
      self.line_items.each do |l|
        if l.item_id == item.id
          l.quantity = l.quantity + 1
        end
      end[0]
    else
      item.line_items.new(cart_id: self.id)
    end
  end


end
