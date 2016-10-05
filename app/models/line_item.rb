class LineItem < ActiveRecord::Base
  belongs_to :cart # fk cart_id
  belongs_to :item # fk item_id

end
