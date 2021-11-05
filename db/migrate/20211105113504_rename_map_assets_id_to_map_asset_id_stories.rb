class RenameMapAssetsIdToMapAssetIdStories < ActiveRecord::Migration[6.1]
  def change
    rename_column :stories, :map_assets_id, :map_asset_id
  end
end
