ActiveAdmin.register Product do
  config.filters = false
  config.per_page = 4

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :list, :of, :attributes, :on, :model, :title, :description, :image, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

   show do |product|
      attributes_table do
        row :title
        row :description
        row :image do
          image_tag(product.image.url)
        end
        row :price
      end
    end

  index do |product|
    selectable_column
    id_column
    column :title
    column :description
    column :image do |img|
      div :class => "image_size" do
       image_tag(img.image)
      end
    end
    column :price do |product|
      div :class => "price" do
       number_to_currency(product.price)
      end
    end
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f| 
    f.inputs "Product", :multipart => true do 
      f.input :title 
      f.input :description 
      f.input :image 
      f.input :price 
   end 
    f.actions
  end

end
