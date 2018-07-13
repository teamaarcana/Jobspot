class SearchJobsController < ApplicationController
  def index
    if params[:search].blank?
      @job_posts = JobPost.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @job_posts = JobPost.where("job_title like ?", params[:search])
    end
  end
end
