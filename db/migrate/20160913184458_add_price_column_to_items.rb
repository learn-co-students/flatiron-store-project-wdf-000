class AddPriceColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :price, :decimal
  end
end
