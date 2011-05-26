class CreateUserOrdonnances < ActiveRecord::Migration
  def self.up
    create_table :user_ordonnances do |t|
      t.integer :user_id
      t.integer :ordonnance_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_ordonnances
  end
end
