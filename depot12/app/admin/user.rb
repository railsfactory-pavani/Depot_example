ActiveAdmin.register User do
 config.filters = false
 config.per_page = 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :list, :of, :attributes, :on, :model, :name, :email, :address, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
   index do
    selectable_column
    id_column
    column :name
    column :email
    column :address
    column :current_sign_in_at
    column :created_at
    actions
  end
  
   form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :address
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
