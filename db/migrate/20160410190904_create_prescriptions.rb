class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :quantity
      t.string :frequency
      t.string :start_date
      t.string :end_date
      t.integer :user_id
      t.integer :drug_id
      t.integer :physician_id 

      t.timestamps null: false
    end
  end
end
