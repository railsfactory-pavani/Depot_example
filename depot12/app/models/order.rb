class Order < ActiveRecord::Base
has_many :products, through: :line_items
has_many :line_items, dependent: :destroy
belongs_to :user
PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
validates :name, :email, presence: true
validates :pay_type, inclusion: PAYMENT_TYPES


after_create :add_status
 
def add_status
  self.update_attributes(status: "pending")
end
  
end
