class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.references :cart, index: true
      t.references :item, index: true
    end
    add_foreign_key :lineitems, :carts
    add_foreign_key :lineitems, :items
  end
end
