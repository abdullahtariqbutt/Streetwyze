class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.string :content
      t.integer :question_type

      t.timestamps
    end
  end
end
