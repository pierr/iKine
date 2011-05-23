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
    add_index :ordonnances, :patient_id #FIXME : audric => Pourquoi il y a un index sur les patient id => Un patient peut avoir plusieurs ordonnances non?
    add_index :ordonnances, :numero   
  end

  def self.down
    remove_index :ordonnances, :patient_id
    drop_table :ordonnances
  end
end
