FactoryGirl.define do
  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    pass = Faker::Number.number(8)
    password              pass
    password_confirmation pass

    after(:create) do |user|
      create(:member, user: user, group: create(:group))
    end
  end
end
