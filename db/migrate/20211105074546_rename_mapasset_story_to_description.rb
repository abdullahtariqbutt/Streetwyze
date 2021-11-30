class RenameMapassetStoryToDescription < ActiveRecord::Migration[6.1]
  def change
    rename_column :map_assets, 'story', 'description'
  end
end
