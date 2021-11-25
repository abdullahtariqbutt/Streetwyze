class RemoveQuestionAnswerIdsFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_column :responses, :question_id
    remove_column :responses, :answer_id
  end
end
