FactoryGirl.define do
  factory :message do
    body      "hello"
    image     File.open(File.join(Rails.root, '/spec/fixtures/img/sample.jpg'))
    group_id  1
    user_id   1
  end

  factory :user do
    id                    1
    name                  "智之"
    email                 "xxx@gmail.com"
    password              "12345678"
    password_confirmation "12345678"
  end

  factory :group do
    id   1
    name "テストグループ"
  end
end
