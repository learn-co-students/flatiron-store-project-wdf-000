class Cart < ActiveRecord::Base
  enum status: [:not_submitted, :submitted]
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  belongs_to :order

  def total
    line_items.collect{|line_item| line_item.quantity * line_item.item.price}.sum
  end

  def add_item(item_id)
    if current_item = line_items.where(item_id: item_id).first
      current_item.increment!(:quantity, current_item.item_id)
    else
      current_item = line_items.build(item_id: item_id)
    end
    current_item
  end
#TODO convert @cart to @order & dry_clean
  def checking_out
    line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory -= line_item.quantity)
    end
    self.update(status: 1)
  end

  def checked_out
    self.user.update(current_cart_id: nil)
    self.user.save
  end
end
