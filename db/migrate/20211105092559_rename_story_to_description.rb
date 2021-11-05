class RenameStoryToDescription < ActiveRecord::Migration[6.1]
  def change
    rename_column :stories, 'story', 'description'
  end
end
