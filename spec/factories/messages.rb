FactoryGirl.define do
  factory :message do
    body      "hello"
    image     File.open(File.join(Rails.root, '/spec/fixtures/img/sample.jpg'))
    group     { create(:group) }
    user      { create(:user) }
  end
end
