class AddQauntityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :qauntity, :integer, :default => 1
  end
end
