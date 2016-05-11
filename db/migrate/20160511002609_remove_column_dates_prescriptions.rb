class RemoveColumnDatesPrescriptions < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :start_date, :string
    remove_column :prescriptions, :end_date, :string
  end
end
