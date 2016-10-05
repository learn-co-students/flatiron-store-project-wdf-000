class Cart < ActiveRecord::Base
  belongs_to :user # fk user_id
  has_many :line_items
  has_many :items, through: :line_items

end
