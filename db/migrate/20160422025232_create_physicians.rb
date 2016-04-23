class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :office
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
