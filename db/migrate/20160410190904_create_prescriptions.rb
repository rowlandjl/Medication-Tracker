class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :quantity
      t.string :frequency
      t.string :start_date
      t.string :end_date
      t.integer :user_id, null: false
      t.string :drug_name, null: false
      t.string :physician_name

      t.timestamps null: false
    end
  end
end
