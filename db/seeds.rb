# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
puts "seeding data to the database"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Client.destroy_all

10.times do 
    @client = Client.create!(
        name: Faker::Name.unique.name_with_middle,
        email: Faker::Email.unique.email,
        address: Faker::Address.unique.street_address
    )
end

puts "seeding operation complete!"
