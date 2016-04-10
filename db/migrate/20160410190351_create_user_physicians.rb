class CreateUserPhysicians < ActiveRecord::Migration
  def change
    create_table :user_physicians do |t|
      t.integer :user_id
      t.integer :physician_id

      t.timestamps null: false
    end
  end
end
