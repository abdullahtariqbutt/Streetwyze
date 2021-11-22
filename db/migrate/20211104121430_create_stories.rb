class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :address
      t.string :category
      t.integer :rating
      t.string :stuff_type
      t.string :story

      t.timestamps
    end
  end
end
