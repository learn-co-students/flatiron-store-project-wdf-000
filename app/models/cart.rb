class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
   line_items.inject(0) { |total, item| total += item.item.price * item.quantity }
  end

  def checkout
    line_items.each do |l|
      l.item.inventory -= l.quantity
      l.item.save
    end
    user.current_cart = nil
    user.save
  end

  def add_item(id)
    if line_item = line_items.find_by(item_id: id)
      line_item.quantity += 1
      line_item.save
    else
      line_item = line_items.build(item_id: id)
    end
    line_item
  end

  def show
    @user = current_user
  end

end
