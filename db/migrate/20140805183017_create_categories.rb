class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |c|
      c.string :title
      c.datetime :created_at, null: false
      c.datetime :updated_at, null: false
    end
  end
end
