# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 admins = User.create([
                     { first_name: 'Behram', last_name: 'I', email: 'behram@gmail.com',  password: 'password', password_confirmation: 'password' },
                     { first_name: 'Yawar', last_name: 'A', email: 'yawar@gmail.com',  password: 'password', password_confirmation: 'password' }
                     ])

puts 'admins generated'
