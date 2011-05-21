class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
    
    
    add_index :users, :email, :unique => true
    
    
  end

  def self.down
    
    remove_index :users, :email
    
    drop_table :users
  end
end
