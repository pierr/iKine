class CreateVilles < ActiveRecord::Migration
  def self.up
    create_table :villes do |t|
      t.string :nom
    end
  end

  def self.down
    drop_table :villes
  end
end
