class CreateSeances < ActiveRecord::Migration
  def self.up
    create_table :seances do |t|
      #champs propres
      t.datetime :date_debut
      t.integer :duree
      t.string :commentaire
      t.boolean :paye
      t.boolean :a_domicile
      
      #Lien avec les autres objets de la base
      t.references :ordonnance
      t.references :user
      
      
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :seances
  end
end
