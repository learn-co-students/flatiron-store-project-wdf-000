class Cart < ActiveRecord::Base
  belongs_to :user

  has_many :line_items
  has_many :items, through: :line_items


  def total
    cart_total = 0
   self.line_items.each do |line_item|
      cart_total += (line_item.item.price * line_item.quantity)
   end
   cart_total
  end



  def add_item(item_id)
    # binding.pry
    if line_item = line_items.find_by(item_id: item_id)
      line_item.quantity += 1
    else
      line_item = line_items.build(item_id: item_id)
    end

    line_item
  end


end
