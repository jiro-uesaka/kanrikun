class CreatePatterns < ActiveRecord::Migration[6.1]
  def change
    create_table :patterns do |t|
      t.integer :shop_id, null: false
      t.string :name, null: false
      t.integer :start_time, null: false
      t.integer :end_time, null: false
      t.integer :rest_time, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
