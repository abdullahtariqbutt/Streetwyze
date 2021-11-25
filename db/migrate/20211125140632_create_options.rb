class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :content

      t.timestamps
    end
    add_index :options, :question_id
  end
end
