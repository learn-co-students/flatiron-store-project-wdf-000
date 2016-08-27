class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      # t.belongs_to :user
      t.integer :user_id
      t.string :status
    end
  end
end
