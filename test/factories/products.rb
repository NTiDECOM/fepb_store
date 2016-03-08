FactoryGirl.define do
  factory :product do
    isbn Faker::Code.isbn
    title Faker::Book.title
    author Faker::Book.author
    spiritual_author Faker::Book.author
    publisher Faker::Book.publisher
    buy_price Faker::Number.decimal(2)
    sell_price { buy_price.to_f + 20.00 }
  end
end