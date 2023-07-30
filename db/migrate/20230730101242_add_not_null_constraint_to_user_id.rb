class AddNotNullConstraintToUserId < ActiveRecord::Migration[7.0]
  def change
    change_column :blogs, :user_id, :integere, null: false

  end
end
