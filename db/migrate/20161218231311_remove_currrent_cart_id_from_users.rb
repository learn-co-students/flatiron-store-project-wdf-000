class RemoveCurrrentCartIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :current_cart_id, :integer
  end
end
