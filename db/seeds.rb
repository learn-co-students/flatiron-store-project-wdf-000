10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

# counter = 1
Item.all.each do |item|
  counter = (1..Item.all.count).to_a.shuffle[0]
  item.category_id = counter
  item.save
  # counter += 1
end

User.create(email: "fgh@dfghj.gh", password: "password")
User.create(email: "poihg@kjhvc.gh", password: "password")
