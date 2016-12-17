class Cart < ActiveRecord::Base
  enum status: [:not_submitted, :submitted]
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  has_one :order


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
#TODO convert cart to @order & remove line_items.clear/make status update work
  def checking_out
    line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory -= line_item.quantity)
    end
<<<<<<< HEAD
  end

  def checked_out
=======
    line_items.clear
>>>>>>> 00262675e0bb3c0d7741c1c857f52bf19a96762f
    update(status: 1)
    user.update(current_cart_id: nil)
    line_items.clear
  end
end
