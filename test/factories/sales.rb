FactoryGirl.define do
  factory :sale do
    association :user, factory: :user, strategy: :build
    buyer_name Faker::Name.name
    subtotal Faker::Number.decimal(2)
    total {subtotal}
    status :in_progress
  end
end