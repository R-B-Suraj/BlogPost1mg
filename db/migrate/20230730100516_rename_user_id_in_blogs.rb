class RenameUserIdInBlogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :blogs, :user_id, :old_user_id
  end
end
