class CreatePatterns < ActiveRecord::Migration[6.1]
  def change
    create_table :patterns do |t|
      t.integer :shop_id, null: false
      t.string :name, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.time :rest_time, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
