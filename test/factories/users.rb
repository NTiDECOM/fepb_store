FactoryGirl.define do
  factory :user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    # password: BCrypt::Password.create('123123')
    password '123123'
    password_confirmation '123123'
    admin true    
  end

  trait :complete do
    surname Faker::Name.name
    cpf '076.442.714-81'
    phone1 '996-447-337'
    phone2 '988-265-810'
    city Faker::Address.city
    state Faker::Address.state
    street Faker::Address.street_name
    street_number Faker::Address.building_number
    street_complement Faker::Address.secondary_address
    cep '58038-120'
  end
end