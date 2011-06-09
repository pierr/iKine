class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|



      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.datetime :date_naissance
      
      t.string :pathologie#??????????????????????????????????????????
      
      t.integer :numero_secu

      t.references :civilite
      t.references :adresse
      t.references :medecin
      t.references :carte_vitale
      
      
      t.timestamps
    end
    
    
    #add_index :patients, :email, :unique => true #En fait les enfants ont le même email que les parents je suppose... en tout cas aucune raison d'unicité.
    
    
    
  end

  def self.down
    
    remove_index :patient, :email
    
    drop_table :patients
    
  end
end
