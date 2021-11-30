class AddMapAssetsRefToStories < ActiveRecord::Migration[6.1]
  def change
    add_reference :stories, :map_assets, foreign_key: true
  end
end
