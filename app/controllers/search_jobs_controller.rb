class SearchJobsController < ApplicationController
  def index
    if current_seeker.present?
      @recommended_jobs = current_seeker.seeker_profile.recommended_jobs
    end
    if params[:search].blank?
      @job_posts = JobPost.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @job_posts = JobPost.quick_search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    end
  end
end
