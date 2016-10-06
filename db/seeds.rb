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

User.create(email: 'q@q.com', password: 'qwerasdf')
User.create(email: 'a@a.com', password: 'qwerasdf')
User.create(email: 'w@w.com', password: 'qwerasdf')
