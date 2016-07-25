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

# seed users to try and address spec error - NoMethodError:
# undefined method `carts' for nil:NilClass
# ./spec/models/user_spec.rb:14:in `block (2 levels) in <top (required)>
User.create(email:"a@b.c",password: "password")
User.create(email:"a@b.c",password: "password")
