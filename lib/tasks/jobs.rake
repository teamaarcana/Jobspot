namespace :jobs do
  desc "Delete jobs that pass deadline"
  task delete_jobs: :environment do
    JobPost.where(['deadline < ?', Date.today.to_s]).destroy_all
  end
end
