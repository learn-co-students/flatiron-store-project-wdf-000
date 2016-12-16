class RemoveQauntityFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :qauntity, :integer
  end
end
