class AddIndexToSurveyIdInQuestion < ActiveRecord::Migration[6.1]
  def change
    add_index(:questions, :survey_id)
  end
end
