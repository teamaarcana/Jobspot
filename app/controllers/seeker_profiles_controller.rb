class SeekerProfilesController < ApplicationController
  before_action :set_seeker_profile, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy, :index]
  before_action :authenticate_seeker!, only: [:edit, :update, :destroy,:new,:create]

  # GET /seeker_profiles
  # GET /seeker_profiles.json
  # def index
  #   @seeker_profiles = SeekerProfile.all
  # end

  # GET /seeker_profiles/1
  # GET /seeker_profiles/1.json
  # def show
  #   @recommended_jobs = @seeker_profile.recommended_jobs
  # end

  # GET /seeker_profiles/new
  def new
    @seeker_profile = SeekerProfile.new
    #  5.times do
    #    @seeker_profile.seeker_educations.build
    #    @seeker_profile.seeker_skills.build
    #  end
      @seeker_profile.seeker_categories.build
  end

  # GET /seeker_profiles/1/edit
  def edit
  #  @seeker_profile.seeker_categories.build
  end

  # POST /seeker_profiles
  # POST /seeker_profiles.json
  def create
    @seeker_profile =  current_seeker.create_seeker_profile(seeker_profile_params)
    respond_to do |format|
      if @seeker_profile.save
        format.html { redirect_to root_path, notice: 'Seeker profile was successfully created.' }
        format.json { render :show, status: :created, location: @seeker_profile }
      else
        format.html { render :new }
        format.json { render json: @seeker_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seeker_profiles/1
  # PATCH/PUT /seeker_profiles/1.json
  def update
    respond_to do |format|
      if @seeker_profile.update(seeker_profile_params)
        format.html { redirect_to root_path, notice: 'Seeker profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @seeker_profile }
      else
        format.html { render :edit }
        format.json { render json: @seeker_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seeker_profiles/1
  # DELETE /seeker_profiles/1.json
  def destroy
    @seeker_profile.destroy
    respond_to do |format|
      format.html { redirect_to seeker_profiles_url, notice: 'Seeker profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def applied_jobs
    @applied_jobs= current_seeker.apply_jobs.includes(:job_post)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seeker_profile
      @seeker_profile = SeekerProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seeker_profile_params
      params.require(:seeker_profile).permit(:attachment,:photo,:first_name,:last_name,:prefered_loc,:sex,:phone_no,
                                                                :experience,:salary,:dob,:nationality,:perm_address,:job_status,:certificate,
                                                                :temp_address,:description,:seeker_id, seeker_educations_attributes: SeekerEducation.attribute_names.map(&:to_sym),
                                                                seeker_categories_attributes: SeekerCategory.attribute_names.map(&:to_sym),  seeker_skills_attributes: SeekerSkill.attribute_names.map(&:to_sym))
    end

    def is_owner?
     redirect_to root_path if SeekerProfile.find(params[:id]).seeker != current_seeker
    end
end
