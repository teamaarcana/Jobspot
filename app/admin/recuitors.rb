ActiveAdmin.register Recuitor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :password
#

   index do |id|
     id_column
     column :email
     column :current_sign_in_at
     column :sign_in_count
     column :created_at
     actions
   end
   index as: :grid, default: true do |product|
    link_to product.email, admin_recuitor_path(product)
  end
  index as: :blog do
    title :email
  end
  filter :email

  # form title: 'Create Recuiter' do |f|
  #   inputs 'Details' do
  #     input :email
  #     input :password
  #     input :confirmation_password
  #   end
  #   actions
  # end
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs :email, :password ,:confirmation_password         # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
