ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

   section "Products Available" do
    table_for Product.order("created_at desc") do
      column :title
      column :created_at
    end
    strong{link_to "View all Products", admin_products_path}
   end


   section "Users Registered" do
    table_for User.order("created_at desc") do
      column :name
      column :created_at
    end
     strong{link_to "View all Users", admin_users_path}
   end

   section "Recent Orders" do
    table_for Order.order("created_at desc").limit(5) do
      column :name
      column :email
      column :pay_type
      column :status
    end
    strong{link_to "View all Orders", admin_orders_path}
   end


  section "This week's Orders" do
   table_for Order.where('created_at > ? AND created_at < ?', 1.week.ago, Time.now) do
     column :name
     column :pay_type
   end
  end
 end
end
