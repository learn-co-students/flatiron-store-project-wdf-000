class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    # items.inject(0) { |sum,x|  sum  + x.price }
    line_items.inject(0) { |sum,x|  sum  + (x.quantity * x.item.price ) }
  end

  def add_item(item)
    # tmp = LineItem.find_by(cart_id: self.id , item_id:item)
    tmp = nil
    if !line_items.empty?
      tmp = line_items.detect do |x|
        x.cart_id == self.id && x.item_id == item
      end
    end
    if tmp
      tmp.quantity += 1
      tmp.save
    else
      tmp = LineItem.new(cart_id: self.id , item_id:item)
      self.items << Item.find_by(id:item)
    end
    tmp
  end

end
