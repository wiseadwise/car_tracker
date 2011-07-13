class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :name
      t.integer :identifier, :null => false
      t.timestamps
    end

    add_index :vehicles, :identifier, :unique => true
  end

  def self.down
    drop_table :vehicles
  end
end
