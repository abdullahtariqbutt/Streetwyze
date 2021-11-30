class CreateAssests < ActiveRecord::Migration[6.1]
  def change
    create_table :assests do |t|
      t.string :name
      t.string :address
      t.string :category
      t.boolean :leave_rating, default:true
      t.integer :rating
      t.string :stuff_type
      t.string :story, null:true

      t.timestamps
    end
  end
end
