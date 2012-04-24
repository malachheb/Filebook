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

ActiveRecord::Schema.define(:version => 20120411142851) do

  create_table "comments", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favoris", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "fichier_id"
  end

  create_table "fichiers", :force => true do |t|
    t.string   "fhash"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.string   "data_content_type"
    t.string   "data_file_name"
    t.string   "extension"
    t.string   "tags"
    t.string   "description"
    t.boolean  "trash",             :default => false
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "follows", :force => true do |t|
    t.integer  "userto_id"
    t.integer  "userfrom_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "shared_fichiers", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "dist_id"
    t.integer  "fichier_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.string   "action_type"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pseudo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
