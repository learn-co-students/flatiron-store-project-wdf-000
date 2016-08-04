class AddCheckoutToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :checkout, :boolean
  end
end
