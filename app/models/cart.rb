class Cart < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total = 0
		self.line_items.each do |obj|
			total += obj.total
		end
		total
	end

	def add_item(id)
		line_item = self.line_items.find_by(item_id: id)
    if line_item
      line_item.quantity += 1
    else
      line_item=self.line_items.build(item_id: id)
    end
    line_item
	end

end
