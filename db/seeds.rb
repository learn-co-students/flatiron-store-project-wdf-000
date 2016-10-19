10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(email: "applehead@applehead.com", password: "iamredandyellow")
User.create(email: "unicorns@rainbow.com", password: "ihavewings")
User.create(email: "snickers@candy.com", password: "iamacandy")


Category.create(title: "Kids & Movies")
Category.create(title: "Home, Health & Jewelery")
