class CreateDrugs < ActiveRecord::Migration
  class Drug < ActiveRecord::Base

  end

  class Prescription < ActiveRecord::Base

  end

  def up
    create_table :drugs do |t|
      t.string :name
      t.text :adverse_reactions, array: true, default: []
    end

    add_column :prescriptions, :drug_id, :integer, null: false

    Prescription.all.each do |rx|
      drug_name = rx.drug.capitalize # IBUPROFEN and ibuprofen and Ibuprofen all get treated identically
      if drug_name.present?
        drug = Drug.find_or_create_by(name: drug_name)
        rx.update_attributes(drug_id: drug.id)
      end
    end

    remove_column :prescriptions, :drug
  end

  def down
    add_column :prescriptions, :drug, :string

    Prescription.all.each do |rx|
      if rx.drug.present?
        rx.update_attributes(drug: drug.name)
      end
    end

    remove_column :prescriptions, :drug_id

    drop_table :drugs
  end
end

# ON MIGRATE
# (1) Create drugs table
# (2) Create drug records for existing prescriptions
# (3) Link every prescription to a drug record
#     - Prescription has drug_id rather than drug name

# ON ROLLBACK
# Unlink every prescription to a drug record
# - Prescription has drug name rather than drug id
# Remove drugs table
