class CreateOrdonnances < ActiveRecord::Migration
  def self.up
    create_table :ordonnances do |t|
      
      t.string :numero
      t.string :pathologie
      t.datetime :date
      t.string :prise_en_charge
      t.string :type_prise_en_charge
      t.boolean :paye
      t.integer :nombre_seances
      t.string :bilan
      t.string :caisse
      t.string :mutuelle
      
      
      t.references :patient
      t.references :medecin
      
      
      
      
      
      
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ordonnances
  end
end
