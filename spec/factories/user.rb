FactoryGirl.define do
  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    pass = Faker::Number.number(8)
    password              pass
    password_confirmation pass

  end
end
