class User < ActiveRecord::Base
#after_create :add_user_id
has_many :histories
 after_create :add_user_role

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, presence: true, uniqueness: true
  #has_secure_password
 after_destroy :ensure_an_admin_remains
has_many :line_items
has_many :orders

def add_user_role
    self.update_attributes(role: "user")
  end
 private
 def ensure_an_admin_remains
  if User.count.zero?
    raise "Can't delete last user"
  end
 end
end

  
