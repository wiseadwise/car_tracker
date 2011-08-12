class CreatePersonShifts < ActiveRecord::Migration
  def self.up
    create_table :person_shifts do |t|
      t.integer :driver_id, :null => false
      t.integer :trips_count
      t.integer :vehicle_id, :null => false
      t.integer :shift_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :person_shifts
  end
end
