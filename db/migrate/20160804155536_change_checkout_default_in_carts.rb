class ChangeCheckoutDefaultInCarts < ActiveRecord::Migration
  def change
  	change_column_default :carts, :checkout, false 
  end
end
