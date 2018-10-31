FactoryBot.define do
  factory :skill do
    name {"IT & Telecommunication"}
  end
  factory :invalid_skill, parent: :skill do
    name nil
  end
end
