class AddUserIdToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :user_id, :integer, default: 1
  end
end
