# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Storage.destroy_all
20.times { Storage.create(title:Faker::Lorem.word, price:Faker::Number.within(50..1000), sqm:Faker::Number.within(1..100), address:Faker::Address.city)}
