class SearchJobsController < ApplicationController
  def index
    if params[:search].blank?
      @job_posts = JobPost.order("created_at DESC").paginate(:page => params[:page],
                                                             :per_page => 10)
    else
      @job_posts = JobPost.fuzzy_search(params[:search]).paginate(:page => params[:page],
                                                                  :per_page => 10)
    end
  end
end
