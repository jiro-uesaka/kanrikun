class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.integer :shop_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
