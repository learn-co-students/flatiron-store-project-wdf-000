class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |f|
      f.string :title
      f.integer :inventory
      f.integer :price
      f.integer :category_id
      f.datetime :created_at, null: false
      f.datetime :updated_at, null: false
    end
  end
end
