class RecuitorProfilesController < ApplicationController
 before_action :set_recuitor_profile, only: [:show, :edit, :update, :destroy]
 before_action :is_owner?, only: [:edit, :update, :destroy, :index]

  def index
  end

  def show
  end

  def new
    @recuitor_profile = RecuitorProfile.new
  end

  def create
    @recuitor_profile =  current_recuitor.create_recuitor_profile(recuitor_profile_params)
    if @recuitor_profile.valid?
      redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  private
  def recuitor_profile_params
    params.require(:recuitor_profile).permit(:company_name,:contact_no,:address,:pan_no,:description,:recuitor_id)
  end

  def set_recuitor_profile
    @recuitor_profile = RecuitorProfile.find(params[:id])
  end

  def is_owner?
   redirect_to root_path if RecuitorProfile.find(params[:id]).recuitor != current_recuitor
  end
end
