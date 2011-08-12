class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.integer :person_id
      t.timestamps
    end

    create_table :people do |t|
      t.string :first_name, :null => false
      t.string :second_name, :null => false
      t.string :last_name, :null => false
      t.string :type, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
