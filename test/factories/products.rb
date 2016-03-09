FactoryGirl.define do
  factory :product do
    title Faker::Book.title
    buy_price Faker::Number.decimal(2)
    sell_price { buy_price.to_f + 20.00 }
    year (Faker::Date.between(10.years.ago, Date.today)).year
  end

  trait :ticket do
    author Faker::Book.author
    type 'Ticket'
  end  

  trait :cd do
    author Faker::Book.author
    type 'Cd'
  end

  trait :dvd do
    author Faker::Book.author
    publisher Faker::Book.publisher
    type 'Dvd'
  end

  trait :shirt do
    type 'Shirt'
  end

  trait :book do
    isbn Faker::Code.isbn
    author Faker::Book.author
    spiritual_author Faker::Book.author
    publisher Faker::Book.publisher
    pages_number Faker::Number.number(3)
    synopisis Faker::Lorem.paragraph(2)
    type 'Book'
  end
end