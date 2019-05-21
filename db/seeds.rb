# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(first_name: 'claire', last_name: 'dinsart', email:'clairedd@gmail.com', password: 'password')
user2 = User.create!(first_name: 'florin', last_name: 'diconescu', email:'florincc@gmail.com', password: 'password2')
user3 = User.create!(first_name: 'david', last_name: 'soutoul', email:'davidss@gmail.com', password: 'password3')
Storage.destroy_all
3.times { Storage.create!(title:Faker::Lorem.word, price:Faker::Number.within(50..1000), sqm:Faker::Number.within(1..100), address:Faker::Address.city, user: user1)}
3.times { Storage.create!(title:Faker::Lorem.word, price:Faker::Number.within(50..1000), sqm:Faker::Number.within(1..100), address:Faker::Address.city, user: user2)}
3.times { Storage.create!(title:Faker::Lorem.word, price:Faker::Number.within(50..1000), sqm:Faker::Number.within(1..100), address:Faker::Address.city, user: user3)}

Booking.destroy_all
5.times { Booking.create!(start_date:Faker::Date.backward(14), end_date:Faker::Date.forward(23), total_price:Faker::Number.number(5), status: ['accepted', 'denied', 'pending'].sample, user: user1, storage: user2.storages.sample)}
5.times { Booking.create!(start_date:Faker::Date.backward(14), end_date:Faker::Date.forward(23), total_price:Faker::Number.number(5), status: ['accepted', 'denied', 'pending'].sample, user: user2, storage: user3.storages.sample)}
5.times { Booking.create!(start_date:Faker::Date.backward(14), end_date:Faker::Date.forward(23), total_price:Faker::Number.number(5), status: ['accepted', 'denied', 'pending'].sample, user: user3, storage: user1.storages.sample)}
