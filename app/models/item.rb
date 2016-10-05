class Item < ActiveRecord::Base
  belongs_to :category # fk category_id
  has_many :line_items

end
