class CreateCodeInsees < ActiveRecord::Migration
  def self.up
    create_table :code_insees do |t|
      t.string :numero
      t.references :ville
      t.references :departement
    end
  end

  def self.down
    drop_table :code_insees
  end
end
