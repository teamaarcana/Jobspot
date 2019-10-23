FactoryBot.define do
  factory :job_post do
    job_title {Faker::Job.title}
    no_of_vacancies {rand(1..5)}
    experience {rand(1..5)}
    description {Faker::Lorem.paragraph}
    department {Faker::Job.field}
    job_type {Faker::Job.employment_type}
    recuitor
    location {Faker::Address.city}
    deadline {""}
  end
  factory :invalid_job_post, parent: :job_post do |f|
    job_title nil
  end
end
