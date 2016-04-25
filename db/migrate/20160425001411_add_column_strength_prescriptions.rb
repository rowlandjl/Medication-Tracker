class AddColumnStrengthPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :strength, :string
  end
end
