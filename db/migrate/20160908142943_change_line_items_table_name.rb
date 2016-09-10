class ChangeLineItemsTableName < ActiveRecord::Migration
  def change
    rename_table :lineitems, :line_items
  end
end
