FactoryGirl.define do
  factory :user do
    name 'admin'
    email Faker::Internet.email
    # password: BCrypt::Password.create('123123')
    password '123123'
    password_confirmation '123123'
    admin true
  end
end