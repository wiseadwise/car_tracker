class CreateShifts < ActiveRecord::Migration
  def self.up
    create_table :shifts do |t|
      t.datetime :date, :null => false
      t.string :time, :null => false
      t.integer :master_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :shifts
  end
end
