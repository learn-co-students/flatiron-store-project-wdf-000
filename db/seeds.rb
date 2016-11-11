10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

User.create(name:"El toro",email:"fake@email.com",password:"12345678")
User.create(name:"Mariachi",email:"fake@email.com",password:"12345678")
User.create(name:"Jaya",email:"fake@email.com",password:"12345678")
User.create(name:"Naya",email:"fake@email.com",password:"12345678")

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end
