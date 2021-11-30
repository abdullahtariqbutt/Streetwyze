class ChangeAssestToAsset < ActiveRecord::Migration[6.1]
  def change
    rename_table :assests, :assets
  end
end
