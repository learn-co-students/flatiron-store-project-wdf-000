class Item < ActiveRecord::Base
	has_many :line_items
	has_many :items, through: :line_items
	belongs_to :category

	def self.available_items
		self.all.select {|i| i.inventory > 0}
	end
end
