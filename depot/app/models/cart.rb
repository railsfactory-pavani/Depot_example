class Cart < ActiveRecord::Base
 has_many :line_items, dependent: :destroy

 def add_product(product_id)
  current_item = line_items.find_by(product_id: product_id)
  if current_item
   current_item.quantity += 1
  else
   current_item = line_items.build(product_id: product_id)
  end
   current_item
 end

 def down
  LineItem.where("quantity>1").each do |line_item|
    line_item.quantity.times do
      LineItem.create cart_id: line_item.cart_id,
        product_id: line_item.product_id, quantity: 1
    end 
   line_item.destroy
  end
 end

 def total_price
   line_items.to_a.sum { |item| item.total_price }
 end

end
