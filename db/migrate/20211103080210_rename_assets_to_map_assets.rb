class RenameAssetsToMapAssets < ActiveRecord::Migration[6.1]
  def change
    rename_table :assets, :map_assets
  end
end
