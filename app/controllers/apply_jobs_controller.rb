class ApplyJobsController < ApplicationController
  before_action :authenticate_seeker!,only: [:create]

  def create
    if current_seeker.present?
      @apply_job = ApplyJob.find_or_create_by(apply_jobs_params)
      redirect_to root_path
    else
      flash[:alert] = "Please sign in first"
    end
  end

  private
  def apply_jobs_params
    params.permit(:seeker_id, :job_post_id)
  end
end
