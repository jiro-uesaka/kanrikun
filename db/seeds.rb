# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shop = Shop.create!(
  [
    {name: "東京店", email: 'aaa@aaa', password: "123456"}
  ]
)

date = Date.new(2022/1/1)
count = 0
while count < 500 do
    okane = Random.rand(5000)
    sales = Sale.create!(
      [
        {proceed: okane, shop_id: 1, created_at: date.since(count.days)}
      ]
    )
    count += 1
end