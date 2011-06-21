class CreateAdresses < ActiveRecord::Migration
  def self.up
    create_table :adresses do |t|
      t.string :numero
      t.string :rue
      t.string :complement_adresse
      t.references :code_insee
      t.timestamps
    end
  end

  def self.down
    drop_table :adresses
  end
end
