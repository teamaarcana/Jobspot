# namespace :server_db do
#   desc "Back data"
#   task file: :environment do
#       exec "pg_dump -U ran jobspot_development > development_backup.sql"
#   end
# end


namespace :server_db do
  REPO_DIR = '~/colz_project/Jobspot/backup'

  desc 'Backup DB and commit into git repo'
  task :backup do
  #  `git clone git@github.com:ran010/backup.git #{REPO_DIR}` if !Dir.exist?(REPO_DIR)
    yml = YAML.load_file('config/database.yml')['development']
    `PGPASSWORD="#{ENV['dbpassword']}" pg_dump -h localhost -p 5432 -U #{ENV['dbuser']} #{ENV['dbname']} > #{REPO_DIR}/db.sql`
    `cd #{REPO_DIR} && git add . && git commit -m 'daily backup' && git push origin master`
  end

  # desc 'Restore db from latest dump (grabbed code from capistrano-db-tasks gem)'
  # task :restore do
  #   yml = YAML.load_file('config/database.yml')['production']
  #   database = yml['database']
  #   pgpass = ("PGPASSWORD=#{yml['password']}" if yml['password'].present?)
  #   credentials = " -u #{yml['username']} "
  #   file = "#{REPO_DIR}/db.sql"
  #   terminate_connection_sql = "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '#{database}' AND pid <> pg_backend_pid();"
  #   "#{pgpass} psql -c \"#{terminate_connection_sql};\" #{credentials}; #{pgpass} dropdb #{credentials} #{database}; #{pgpass} createdb #{credentials} #{database}; #{pgpass} psql #{credentials} -d #{database} < #{file}"
  # end

end
