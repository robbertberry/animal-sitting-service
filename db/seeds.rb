# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'admin@gmail.com', password: 'Password1234$', user_type: :admin)
customer = User.create(email: 'simple@gmail.com', password: 'Password1234$', user_type: :customer)
customer.bookings.create([
                { first_name: "Richard", last_name: "Gregory", animal_name: "cato", animal_type: "cat", hours_requested: 2, date_of_service: Date.today }, 
                { first_name: "Richard", last_name: "Gregory", animal_name: "Lexi", animal_type: "dog", hours_requested: 6, date_of_service: Date.today }
              ])