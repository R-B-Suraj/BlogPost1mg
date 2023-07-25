class AddNameToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :name, :string
  end
end
