FactoryBot.define do
  factory :seeker_profile do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name}
    sex {"male"}
    phone_no {Faker::PhoneNumber.cell_phone}
    prefered_loc { Faker::Address.full_address}
    salary {rand(1000..10000)}
    dob {Faker::Date.between(50.year.ago, 10.year.ago)}
    nationality {"Nepalese"}
    perm_address { Faker::Address.city}
    temp_address { Faker::Address.city}
    experience {rand(1..3)}
    description {Faker::Lorem.paragraphs}
    job_status {[true, false].sample}
    seeker
  end
  factory :invalid_seeker_profile, parent: :seeker_profile do |f|
    first_name nil
  end
end
