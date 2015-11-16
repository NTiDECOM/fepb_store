# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  name: 'admin',
  email: 'romero.mfm@gmail.com',
  # password: BCrypt::Password.create('123123'),
  password: '123123',
  admin: true
)

1.upto(2) do |n|
  Book.create(
    title: "Livro #{n}", 
    author: "Autor #{n}", 
    spiritual_author: "Autor espiritual #{n}", 
    buy_price: 20,
  	sell_price: 50, 
    year: 2015, 
    pages_number: n + 100, 
    synopisis: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    active: true
  )
end

1.upto(2) do |n|
  Cd.create(
    title: "Cd #{n}", 
    buy_price: 2,
    sell_price: 10
  )
end

1.upto(2) do |n|
  Dvd.create(
    title: "Dvd #{n}", 
    buy_price: 5,
    sell_price: 20
  )
end

1.upto(2) do |n|
  Shirt.create(
    title: "Camisa #{n}", 
    buy_price: 10,
    sell_price: 20
  )
end

1.upto(2) do |n|
  Ticket.create(
    title: "Ingresso #{n}", 
    buy_price: 2,
    sell_price: 15
  )
end

SaleStatus.delete_all
SaleStatus.create! id: 1, name: "In Progress"
SaleStatus.create! id: 2, name: "Placed"
SaleStatus.create! id: 3, name: "Shipped"
SaleStatus.create! id: 4, name: "Cancelled"