class Category < ActiveRecord::Base
  has_many :items
  has_many :line_items, through: :items
end
