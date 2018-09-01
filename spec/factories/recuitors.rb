FactoryBot.define do
  factory :recuitor do
    email {Faker::Internet.email}
    password {"aaaaaa"}
  end
end
