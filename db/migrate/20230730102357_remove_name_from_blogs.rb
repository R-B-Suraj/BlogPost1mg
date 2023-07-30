class RemoveNameFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :name, :string
  end
end
