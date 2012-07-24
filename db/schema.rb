# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120720102300) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "type"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "event_id"
    t.integer  "format_id"
    t.integer  "number"
    t.text     "legend"
    t.text     "prequel"
    t.integer  "price"
    t.string   "area"
    t.string   "brief_place"
    t.string   "team_list"
    t.string   "dopy_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["event_id"], :name => "index_games_on_event_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], :name => "index_groups_on_name", :unique => true

  create_table "invites", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "state"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_formats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id", :null => false
  end

  add_index "project_formats", ["name"], :name => "index_project_formats_on_name", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name"], :name => "index_projects_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "group_id"
    t.string   "site_role"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.integer  "game_count"
    t.integer  "scores"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.boolean  "is_enabled",             :default => true, :null => false
    t.string   "team_role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
