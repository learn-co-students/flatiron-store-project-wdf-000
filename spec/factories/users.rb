FactoryGirl.define do
  factory :user do
    # binding.pry
    email "#{Faker::Name.first_name}@faked.org"
    password "#{Faker::Color.name.gsub(/\s/,"1")}123456"
  end
end
