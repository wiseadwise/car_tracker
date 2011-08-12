# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110727181554) do

  create_table "people", :force => true do |t|
    t.string   "first_name",  :null => false
    t.string   "second_name", :null => false
    t.string   "last_name",   :null => false
    t.string   "type",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_shifts", :force => true do |t|
    t.integer  "driver_id",   :null => false
    t.integer  "trips_count"
    t.integer  "vehicle_id",  :null => false
    t.integer  "shift_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", :force => true do |t|
    t.datetime "date",       :null => false
    t.string   "time",       :null => false
    t.integer  "master_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.integer  "vehicle_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.string   "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.integer  "identifier", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["identifier"], :name => "index_vehicles_on_identifier", :unique => true

end
