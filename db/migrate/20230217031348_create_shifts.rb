class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.integer :shop_id, null: false
      t.integer :worker_id, null: false
      t.integer :day1, null: false
      t.integer :day2, null: false
      t.integer :day3, null: false
      t.integer :day4, null: false
      t.integer :day5, null: false
      t.integer :day6, null: false
      t.integer :day7, null: false
      t.integer :day8, null: false
      t.integer :day9, null: false
      t.integer :day10, null: false
      t.integer :day11, null: false
      t.integer :day12, null: false
      t.integer :day13, null: false
      t.integer :day14, null: false
      t.integer :day15, null: false
      t.integer :day16, null: false
      t.integer :day17, null: false
      t.integer :day18, null: false
      t.integer :day19, null: false
      t.integer :day20, null: false
      t.integer :day21, null: false
      t.integer :day22, null: false
      t.integer :day23, null: false
      t.integer :day24, null: false
      t.integer :day25, null: false
      t.integer :day26, null: false
      t.integer :day27, null: false
      t.integer :day28, null: false
      t.integer :day29, null: false
      t.integer :day30, null: false
      t.integer :day31, null: false

      t.timestamps
    end
  end
end
