# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(56) do |n|
  Book.create(
  	title: "Book #{n}", 
  	author: "Author #{n}", 
  	spiritual_author: "Spiritual author #{n}", 
  	sell_price: n+10
  )
end

User.create(name: 'Admin', 
	email: 'romero.mfm@gmail.com', 
	password_digest: BCrypt::Password.create('123123')
)