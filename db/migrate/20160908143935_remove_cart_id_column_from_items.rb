class RemoveCartIdColumnFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :cart_id
  end
end
