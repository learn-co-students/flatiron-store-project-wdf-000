class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    # line_items.collect(&:item).collect(&:price).inject(:+).to_f
    # This needs major refatoring
    result = []
    line_items.collect do |l|
      items.each do |item|
        result << item.price * l.quantity if l.item_id == item.id
      end
    end
    result.inject(:+).to_f
  end

  def add_item(item_id)
    if line_item = line_items.find_by(item_id: item_id)
      # line_item.update(quantity: line_item.quantity + 1)
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
    self.status = nil
    self.user.current_cart_id = nil
    user.save
    save
  end

end
