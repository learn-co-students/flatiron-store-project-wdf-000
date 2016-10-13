class Item < ActiveRecord::Base
  belongs_to :category

  has_many :line_items

  def self.available_items
    # Item.all.map{|i| i.inventory > 1}
      items = []
      Item.all.map do |i|
        if i.inventory >= 1
          items << i
        end
      end

      items
  end


    def checkout
     self.items.each do |item|
       item.update(inventory: item.inventory - quantity(item))
     end
     self.update(status: "submitted", user_id: nil)
   end



end
