class RemoveLeaveRatingFromAsset < ActiveRecord::Migration[6.1]
  def change
    remove_column :assets, :leave_rating
  end
end
