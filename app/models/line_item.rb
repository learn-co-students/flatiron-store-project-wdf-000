class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def total
    sum = 0
    quantity.times do 
      sum += Item.find_by(id: item_id).price
    end
    sum
  end
end
