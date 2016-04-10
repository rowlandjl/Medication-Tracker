class CreateHealthConditions < ActiveRecord::Migration
  def change
    create_table :health_conditions do |t|
      t.string :name
      t.string :diagnosis_date
      t.integer :user_id
    end
  end
end
