class CreateUserOrdonnances < ActiveRecord::Migration
  def self.up
    create_table :user_ordonnances do |t|
      t.references :user
      t.references :ordonnance
      t.timestamps
    end
  end

  def self.down
    drop_table :user_ordonnances
  end
end
