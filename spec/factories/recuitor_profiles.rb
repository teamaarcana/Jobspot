FactoryBot.define do
  factory :recuitor_profile do
    company_name {Faker::Company.name}
    contact_no {Faker::PhoneNumber.cell_phone}
    address { Faker::Address.full_address}
    pan_no {Faker::Company.duns_number}
    description {Faker::Lorem.paragraphs}
    recuitor
    industry {Faker::Company.industry}
    website {"www.testsite.com"}
    email {"test  @test.com"}
  end
  factory :invalid_recuitor_profile, parent: :recuitor_profile do |f|
    company_name nil
  end
end
