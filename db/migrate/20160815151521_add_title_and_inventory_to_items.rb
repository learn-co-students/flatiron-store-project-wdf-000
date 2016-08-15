class AddTitleAndInventoryToItems < ActiveRecord::Migration
  def change
    add_column :items, :title, :string
    add_column :items, :inventory, :integer
  end
end
