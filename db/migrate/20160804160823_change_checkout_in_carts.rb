class ChangeCheckoutInCarts < ActiveRecord::Migration
  def change
  	remove_column :carts, :checkout, :boolean
  	add_column :carts, :status, :string
  end
end
