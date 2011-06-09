class CreateCodePostals < ActiveRecord::Migration
  def self.up
    create_table :code_postals do |t|
      t.string :numero
      t.references :code_insee
    end
  end

  def self.down
    drop_table :code_postals
  end
end
