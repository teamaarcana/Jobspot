FactoryBot.define do
  factory :seeker do
    email {Faker::Internet.email}
    password {"aaaaaa"}
  end
  factory :invalid_seeker, parent: :seeker do |f|
    email nil
  end
end
