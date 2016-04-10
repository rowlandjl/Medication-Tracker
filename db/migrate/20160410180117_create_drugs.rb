class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :strength
      t.string :drug_class
      t.string :adverse_reaction
      t.string :indications
    end
  end
end
