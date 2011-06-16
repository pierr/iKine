class CreateBilans < ActiveRecord::Migration
  def self.up
    create_table :bilans do |t|
      t.string :initial
      t.date :date_initial
      t.string :intermediaire
      t.date :date_intermediaire
      t.string :final
      t.date :date_final
      t.references :ordonnance
      t.timestamps
    end
  end

  def self.down
    drop_table :bilans
  end
end
