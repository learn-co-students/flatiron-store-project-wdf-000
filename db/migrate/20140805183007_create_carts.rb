class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |f|
      f.string :status, default: "not submitted"
      f.integer :user_id
      f.datetime :created_at, null: false
      f.datetime :updated_at, null: false
    end
  end
end
