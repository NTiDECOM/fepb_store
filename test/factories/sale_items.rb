FactoryGirl.define do
  factory :sale_item do
    association :sale, factory: :sale, strategy: :build
    association :product, factory: :product, strategy: :build
    product_quantity Faker::Number.number(2)
    unit_price Faker::Number.decimal(2)
    total_price {(unit_price.to_f * product_quantity.to_i)}
  end
end