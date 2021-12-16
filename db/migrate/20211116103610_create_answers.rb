class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :survey_id
      t.string :content

      t.timestamps
    end
    add_index :answers, :question_id
    add_index :answers, :survey_id
  end
end
