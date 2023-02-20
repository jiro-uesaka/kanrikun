class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :shop_id, null: false
      t.string :name, null: false
      t.integer :price, null: false, default: 0
      t.string :status, null: false
      t.integer :stock, null: false, default: 0
      t.integer :order, null: false, default: 0
      

      t.timestamps
    end
  end
end
