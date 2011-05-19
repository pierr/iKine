class CreateAdresses < ActiveRecord::Migration
  def self.up
    create_table :adresses do |t|
      
      
      t.string :nom
      
      t.references :ville
      
      
      
      

      t.timestamps
    end
  end

  def self.down
    drop_table :adresses
  end
end
