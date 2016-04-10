class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :name
      t.text :description
      t.string :reaction_date
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
