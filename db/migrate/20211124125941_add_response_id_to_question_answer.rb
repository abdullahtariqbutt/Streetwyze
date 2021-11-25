class AddResponseIdToQuestionAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :response_id, :integer
    add_column :answers, :response_id, :integer
  end
end
