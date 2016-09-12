class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items
	belongs_to :user

	def total
		line_items.inject(0) {|t, i| t += i.item.price * i.quantity}
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
		self.line_items.each do |l|
			l.item.inventory -= l.quantity
			l.item.save
		end
		self.user.current_cart_id = nil
		self.user.save
	end
end