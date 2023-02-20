class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.integer :shop_id, null: false
      t.integer :proceed, null: false

      t.timestamps
    end
  end
end
