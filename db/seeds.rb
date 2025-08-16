Product.destroy_all

676.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 1.0..1000.0, as_string: false),
    stock_quantity: Faker::Number.between(from: 0, to: 100)
  )
end

puts "Created #{Product.count} products"