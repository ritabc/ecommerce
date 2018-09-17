50.times do |index|
  Product.create!(item: Faker::Book.title, price: Faker::Number.decimal(2))
end
