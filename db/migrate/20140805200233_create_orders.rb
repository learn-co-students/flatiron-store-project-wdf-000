class CreateOrders < ActiveRecord::Migration
  def change
    create_table :order do |t|
      t.string :name
    end
  end
end
