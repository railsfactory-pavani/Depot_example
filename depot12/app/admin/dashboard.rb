ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    section "Recent Orders" do
     table_for Order.order("created_at desc").limit(5) do
      column :id do |id|
          link_to id.id, admin_order_path(id.id), :onclick=>"window.open(this.href,'orders_path', 'height=1000, width=600');return false;"
      end
      column :name
      column :address  
      column :email
      column :pay_type
      column :status do |order|
          div  :class => "status" do
          status_tag(order.status)
          end
        end
    end
    strong{link_to "View all Orders", admin_orders_path}
   end

   section "Products Available" do
    table_for Product.order("created_at desc").limit(4) do
      column :title do |title|
        link_to title.title, admin_product_path(title.id), :onclick=>"window.open(this.href,'products_path', 'height=2000, width=800');return false;"
      end
      column :created_at
       column :price do |product|
      div :class => "price" do
       number_to_currency(product.price)
      end
    end    
   end
   strong{link_to "View all Products", admin_products_path}
 end

   section "Users Registered" do
    table_for User.order("created_at desc") do
      column :name do |id|
          link_to id.name, admin_user_path(id.id), :onclick=>"window.open(this.href,'users_path', 'height=2000, width=800');return false;"
      end
      column :email
      column :created_at
    end
     strong{link_to "View all Users", admin_users_path}
   end

  


  section "This week's Orders" do
   table_for LineItem.order("created_at desc") do
      column :product do |id|
          link_to id.product.title, admin_product_path(id.product.id), :onclick=>"window.open(this.href,'products_path', 'height=1000, width=600');return false;"
      end
     column :user do |id|
          link_to id.user.name, admin_user_path(id.user.id), :onclick=>"window.open(this.href,'users_path', 'height=1000, width=600');return false;"
      end
   end
  end
 end
end
