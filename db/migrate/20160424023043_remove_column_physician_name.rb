class RemoveColumnPhysicianName < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :physician_name, :string
    add_column :prescriptions, :physician_id, :integer
  end
end
