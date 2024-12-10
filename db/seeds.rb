require 'faker'

# Clear existing data
Booking.destroy_all
Flat.destroy_all
User.destroy_all

# Create Users
puts "Creating users..."
users = []

# Add specific users
users << User.create!(
  email: "sam@gmail.com",
  password: "password"
)

users << User.create!(
  email: "pym@gmail.com",
  password: "password"
)
puts "Created #{users.count} users."

# Create Flats
puts "Creating flats..."
flats = []
20.times do
  flats << Flat.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    imag_url: Faker::LoremFlickr.image(size: "640x480", search_terms: ['house', 'apartment']),
    rating: rand(1..5),
    price: rand(50..500), # Random price between $50 and $500
    address: Faker::Address.full_address, # Generate a realistic address
    user: users.sample
  )
end
puts "Created #{flats.count} flats."

# Create Bookings
puts "Creating bookings..."
30.times do
  start_date = Faker::Date.forward(days: rand(1..30)) # Random start date within the next month
  end_date = start_date + rand(1..7).days # End date is 1 to 7 days after the start date

  Booking.create!(
    user: users.sample,
    flat: flats.sample,
    start_date: start_date,
    end_date: end_date
  )
end
puts "Created 30 bookings."

puts "Seeding completed!"
