class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :survey_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :survey_id
    add_index :responses, :question_id
    add_index :responses, :answer_id
  end
end
