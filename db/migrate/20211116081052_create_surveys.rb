class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :script

      t.timestamps
    end
  end
end
