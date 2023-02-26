class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :shop_id, null: false
      t.integer :item_id, null: false
      t.string :name, null: false
      t.integer :amount, null: false
      t.integer :total_price, null: false
      t.string :status, null: false
      

      t.timestamps
    end
  end
end
