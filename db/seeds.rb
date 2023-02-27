# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# shop = Shop.create!(
#   [
#     {name: "東京店", email: 'aaa@aaa', password: "123456"}
#   ]
# )

# date = Date.new(2022/1/1)
# count = 0
# while count < 500 do
#     okane = Random.rand(5000)
#     sales = Sale.create!(
#       [
#         {proceed: okane, shop_id: 1, created_at: date.since(count.days)}
#       ]
#     )
#     count += 1
# end
item = Item.last
order = Order.create!(
   [
     {shop_id: 1, item_id: item.id, name: item.name, amount: 2, total_price: (item.price * 2), status: "in_order", created_at: "2023/1/7"}
   ]
 )