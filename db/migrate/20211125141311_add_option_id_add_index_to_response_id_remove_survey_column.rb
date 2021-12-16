class AddOptionIdAddIndexToResponseIdRemoveSurveyColumn < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :option, index: true
    add_index :answers, :response_id
    remove_column :answers, :survey_id
  end
end
