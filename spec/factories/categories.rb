FactoryBot.define do
  factory :category do
    name {"Programming"}
  end
  factory :invalid_category, parent: :skill do
    name nil
  end
end
