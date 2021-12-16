class AddUserRefToSurvey < ActiveRecord::Migration[6.1]
  def change
    add_reference :surveys, :user, index: true
  end
end
