class CreateCarteVitales < ActiveRecord::Migration
  def self.up
    create_table :carte_vitales do |t|
      t.string :numero_secu # TODO Est ce que les enfants ont le numero de secu des parents?
      t.timestamps
    end
  end

  def self.down
    drop_table :carte_vitales
    
  end
end
