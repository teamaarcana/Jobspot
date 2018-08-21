class SearchJobsController < ApplicationController
  def index
    if params[:search].blank?
      @job_posts = JobPost.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      strings_to_query = JobPost.select('id','job_title','location','job_type','department').joins(:skills,:categories).select('skills.name','categories.name')



      query = params[:search]
      binding.pry
      query_reg = /#{query.split('').join('.*?')}/
      sorted = []
      strings_to_query.each do |string|
        educations = string.educations.pluck(:eduName).join("','")
        categories = string.categories.pluck(:name).join("','")
        skills =  string.skills.pluck(:name).join("','")
          match = query_reg.match string.job_title + ' ' + categories + ' ' + skills
          sorted << {string: string, rank: match.to_s.length} if match
      end
   @job_posts = sorted.sort_by! {|i| i[:rank] }

      sorted.each do |pair|
          puts "#{pair[:rank]} : #{pair[:string]}"
      end
      # @job_posts = JobPost.quick_search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    end
  end
end
