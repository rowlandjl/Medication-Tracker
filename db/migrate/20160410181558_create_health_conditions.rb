class CreateHealthConditions < ActiveRecord::Migration
  def change
    create_table :health_conditions do |t|
      t.string :name, null: false 
      t.string :diagnosis_date
      t.integer :user_id
    end
  end
end
