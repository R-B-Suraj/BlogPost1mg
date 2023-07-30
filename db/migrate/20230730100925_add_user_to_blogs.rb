class AddUserToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :user, foreign_key: true
    Blog.find_each do |comment|
      comment.update_column(:user_id, 1)
    end
  
  end
end
