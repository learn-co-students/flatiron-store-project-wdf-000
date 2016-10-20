class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |c|
      c.integer :user_id
      c.string :status, default: "not submitted"
      c.datetime :created_at, null:false
      c.datetime :updated_at, null:false
    end
  end
end
