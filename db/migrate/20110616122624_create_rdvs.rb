class CreateRdvs < ActiveRecord::Migration
  def self.up
    create_table :rdvs do |t|
      t.string :lieu
      t.string :contact
      t.date :date
      t.references :patient
      t.references :adresse
      t.timestamps
    end
  end

  def self.down
    drop_table :rdvs
  end
end
