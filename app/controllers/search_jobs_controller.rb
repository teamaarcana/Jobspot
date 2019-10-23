class SearchJobsController < ApplicationController
  def index
    if params[:search].blank?
      @job_posts = JobPost.order("created_at DESC").all
    else
      @job_posts = JobPost.where("job_title like ?", params[:search])

    end
  end
end
