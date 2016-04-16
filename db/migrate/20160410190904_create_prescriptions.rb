class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :drug, null: false
      t.string :quantity
      t.string :dose_count
      t.string :frequency
      t.string :start_date
      t.string :end_date
      t.integer :user_id, null: false
      t.string :physician_name

      t.timestamps null: false
    end
  end
end
