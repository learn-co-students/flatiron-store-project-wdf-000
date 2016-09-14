10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: "Category 1")
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.price = item.price/100
  item.save
  counter += 1
end
User.create(:email => "username@gmail.com", :password =>"Password")
