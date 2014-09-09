ActiveAdmin.register Order do
  config.filters = false
  config.per_page = 2
  actions :all, :except => [:new]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :list, :of, :attributes, :on, :model, :name, :email, :pay_type, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

 show do |order|
    div do
      attributes_table do
        row :name
        row :address
        row :pay_type
        row :status
      end
    end
    div do      
      panel("Items") do
        table_for(order.line_items) do
          
          column "Title" do |i| 
            i.product.title
          end
          column :quantity
          column "Price" do |i| 
            number_to_currency(i.total_price)

            
          end
               
          end
        
      end
    end
  end
end


