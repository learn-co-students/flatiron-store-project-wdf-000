class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status, default: "not submitted"
      t.integer :user_id
      t.integer :cart_id
      t.integer :total

      t.timestamps null: false
    end
  end
end
