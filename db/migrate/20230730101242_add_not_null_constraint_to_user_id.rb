class AddNotNullConstraintToUserId < ActiveRecord::Migration[7.0]
  def change
    change_column :blogs, :user_id, :integer, null: false
    
  end
end
