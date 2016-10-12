class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items

	def total
    self.line_items.inject(0) do |sum, n|
      sum + (n.quantity)*(n.item.price)
    end
		# sum = 0
		# self.items.each do |item|
		# 	sum += item.price
		# end
		# sum
	end

  def quantity(item)
    LineItem.find_by(item_id: item.id).quantity
  end

  def checkout
    self.items.each do |item|
      item.update(inventory: item.inventory - quantity(item))
    end
    self.update(status: "submitted", user_id: nil)
  end

	def add_item(cart_item_id)
    #Like find_or_create_by, but calls new instead of create.
    LineItem.find_or_initialize_by(cart_id: self.id, item_id: cart_item_id)
	end

end
