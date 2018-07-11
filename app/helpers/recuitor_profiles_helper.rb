module RecuitorProfilesHelper
  def profile(id)
    a= Seeker.find_by_id(id).seeker_profile
    a.first_name + " " +a.last_name
  end
end
