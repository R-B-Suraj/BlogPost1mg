class AddDefaultDeletedToBlogs < ActiveRecord::Migration[7.0]
  def change
    change_column_default :blogs, :deleted, 0
  end
end
