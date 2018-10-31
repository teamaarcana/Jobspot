ActiveAdmin.register JobPost do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :job_title, :recuitor_id, job_skills_attributes: [:id, :skill_id],
                            job_categories_attributes: [:id, :category_id],
                            job_educations_attributes: [:id, :education_id]

  belongs_to :recuitor, optional: true

  form do |f|
    f.inputs 'Details' do
      f.input :job_title
      f.input :recuitor_id
    end
    f.inputs do
     f.has_many :job_categories, allow_destroy: true do |a|
       a.select(:category_id, Category.all.collect {|u| [u.name, u.id]})
     end
   end
   f.inputs do
      f.has_many :job_skills, allow_destroy: true do |a|
        a.select(:skill_id, Skill.all.collect {|u| [u.name, u.id]})
      end
    end
    f.inputs do
     f.has_many :job_educations, allow_destroy: true do |a|
       a.select(:education_id, Education.all.collect {|u| [u.eduName, u.id]})
     end
   end
   actions
  end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
