class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def price
    item.price * quantity
  end
end
