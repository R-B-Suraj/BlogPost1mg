class RemoveUserIdFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :user_id, :integer
  end
end
