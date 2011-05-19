class CreateSeances < ActiveRecord::Migration
  def self.up
    create_table :seances do |t|
      
      t.datetime :date_debut
      t.integer :duree
      t.string :commentaire
      t.boolean :paye
      t.boolean :a_domicile
      
      
      t.references :ordonnance
      
      
      
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :seances
  end
end
