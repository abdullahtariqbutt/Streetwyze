class RemoveUserNameIndexFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :user_name
  end
end
