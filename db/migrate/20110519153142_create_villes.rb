class CreateVilles < ActiveRecord::Migration
  def self.up
    create_table :villes do |t|


      t.string :nom
      
      t.string :code_postal
      t.references :departement


      t.timestamps
    end
  end

  def self.down
    drop_table :villes
  end
end
