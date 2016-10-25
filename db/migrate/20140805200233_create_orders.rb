class CreateOrders < ActiveRecord::Migration
  def change

    create_table :orders do |t|
      t.string :title
    end

  end
end
