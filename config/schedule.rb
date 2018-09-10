set :output, '~/Desktop/file.log'

job_type :rake, "cd :path && RAILS_ENV=development bundle exec rake server_db:backup --silent :output"

every 1.day, at: '12:00 am' do
  rake "jobs:delete_jobs"
end
every 1.day, at: '18:17 pm' do
  rake "server_db:backup"
end
