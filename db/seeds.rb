# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([name: 'Chicago', name: 'Copenhagen'])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create(
  name: 'admin',
  email: 'romero.mfm@gmail.com',
  # password: BCrypt::Password.create('123123'),
  password: '123123',
  admin: true
)

1.upto(20) do |n|
  Book.create(
    isbn: Faker::Code.isbn,
    title: Faker::Book.title,
    author: Faker::Book.author,
    spiritual_author: Faker::Book.author,
    publisher: Faker::Book.publisher,
    buy_price: Faker::Number.decimal(2),
    sell_price: Faker::Number.decimal(2).to_f + 30.00,
    year: (Faker::Date.between(2.days.ago, Date.today)).year,
    pages_number: Faker::Number.number(3),
    synopisis: Faker::Lorem.paragraph(2),
    type: 'Book'
  )
end

1.upto(20) do |n|
  Cd.create(
    title: Faker::Hipster.word,
    buy_price: Faker::Number.decimal(2),
    sell_price: Faker::Number.decimal(2).to_f + 20.00,
    year: (Faker::Date.between(2.days.ago, Date.today)).year,
    type: 'Cd'
  )
end

1.upto(20) do |n|
  Dvd.create(
    title: Faker::Hipster.word,
    buy_price: Faker::Number.decimal(2),
    sell_price: Faker::Number.decimal(2).to_f + 20.00,
    year: (Faker::Date.between(2.days.ago, Date.today)).year,
    type: 'Dvd'
  )
end

1.upto(20) do |n|
  Shirt.create(
    title: Faker::Hipster.word,
    buy_price: Faker::Number.decimal(2),
    sell_price: Faker::Number.decimal(2).to_f + 20.00,
    type: 'Shirt'
  )
end

1.upto(20) do |n|
  Ticket.create(
    title: Faker::Hipster.word,
    buy_price: Faker::Number.decimal(2),
    sell_price: Faker::Number.decimal(2).to_f + 20.00,
    type: 'Ticket'
  )
end
