class RemoveResponseIdFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :response_id
  end
end
