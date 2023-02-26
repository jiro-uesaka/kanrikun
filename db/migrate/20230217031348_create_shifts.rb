class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.integer :shop_id, null: false
      t.integer :worker_id, null: false
      t.integer :day1
      t.integer :day2
      t.integer :day3
      t.integer :day4
      t.integer :day5
      t.integer :day6
      t.integer :day7
      t.integer :day8
      t.integer :day9
      t.integer :day10
      t.integer :day11
      t.integer :day12
      t.integer :day13
      t.integer :day14
      t.integer :day15
      t.integer :day16
      t.integer :day17
      t.integer :day18
      t.integer :day19
      t.integer :day20
      t.integer :day21
      t.integer :day22
      t.integer :day23
      t.integer :day24
      t.integer :day25
      t.integer :day26
      t.integer :day27
      t.integer :day28
      t.integer :day29
      t.integer :day30
      t.integer :day31

      t.timestamps
    end
  end
end
