class AddRefOfUsersToAssetsAndStories < ActiveRecord::Migration[6.1]
  def change
    add_reference :map_assets, :user, foreign_key: true
    add_reference :stories, :user, foreign_key: true
  end
end
