FactoryGirl.define do
  factory :book do
    isbn Faker::Code.isbn
    title Faker::Book.title
    author Faker::Book.author
    spiritual_author Faker::Book.author
    publisher Faker::Book.publisher
    buy_price Faker::Number.decimal(2)
    sell_price { buy_price.to_f + 20.00 }
    year (Faker::Date.between(2.days.ago, Date.today)).year
    pages_number Faker::Number.number(3)
    synopisis Faker::Lorem.paragraph(2)
    type 'Book'
  end
end