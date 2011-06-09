class CreateDepartements < ActiveRecord::Migration
  def self.up
    create_table :departements do |t|
      t.string :numero
      t.string :nom
    end
  end

  def self.down
    drop_table :departements
  end
end
