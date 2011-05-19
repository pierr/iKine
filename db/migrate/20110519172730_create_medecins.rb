class CreateMedecins < ActiveRecord::Migration
  def self.up
    create_table :medecins do |t|
      
      
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      
      
      t.references :adresse
      
      
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :medecins
  end
end
