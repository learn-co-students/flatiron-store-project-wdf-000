class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |i|
      i.string :title
      i.integer :inventory
      i.integer :price
      i.integer :category_id
      i.datetime :created_at, null: false
      i.datetime :updated_at, null: false
    end
  end
end
