class CreateRdvs < ActiveRecord::Migration
  def self.up
    create_table :rdvs do |t|
      
      t.datetime :date
      t.integer :duree
      t.boolean :a_domicile
      t.boolean :nouveau_patient
      t.string :telephone
      t.string :email
      t.string :commentaire
      
      
      t.references :patient
      t.references :adresse
      
      
      
      
      
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :rdvs
  end
end
