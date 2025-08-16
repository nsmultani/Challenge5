require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product_row|
  category_name = product_row['category']
  
  category = Category.find_or_create_by(name: category_name)
  
  Product.create!(
    title: product_row['name'],  
    description: product_row['description'],
    price: product_row['price'].to_f,
    stock_quantity: product_row['stock quantity'].to_i,  \
    category: category
  )
end

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
