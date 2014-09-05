class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :comments

      t.timestamps
    end
  end
end
