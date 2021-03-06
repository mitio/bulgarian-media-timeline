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

ActiveRecord::Schema.define(:version => 20150316120922) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "events", :force => true do |t|
    t.integer  "category_id",                          :null => false
    t.string   "title",                                :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.boolean  "published",          :default => true, :null => false
    t.integer  "priority",           :default => 0,    :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_caption"
    t.string   "image_credit"
    t.string   "external_image_url"
  end

  create_table "events_media", :force => true do |t|
    t.integer "event_id", :null => false
    t.integer "media_id", :null => false
  end

  add_index "events_media", ["event_id", "media_id"], :name => "index_events_media_on_event_id_and_media_id", :unique => true

  create_table "events_media_types", :force => true do |t|
    t.integer "event_id",      :null => false
    t.integer "media_type_id", :null => false
  end

  add_index "events_media_types", ["event_id", "media_type_id"], :name => "index_events_media_types_on_event_id_and_media_type_id", :unique => true

  create_table "events_people", :force => true do |t|
    t.integer "event_id",  :null => false
    t.integer "person_id", :null => false
  end

  add_index "events_people", ["event_id", "person_id"], :name => "index_events_people_on_event_id_and_person_id", :unique => true

  create_table "media", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "year_created"
    t.integer  "year_closed"
    t.integer  "current_owner_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "media_media_types", :force => true do |t|
    t.integer "media_id",      :null => false
    t.integer "media_type_id", :null => false
  end

  add_index "media_media_types", ["media_id", "media_type_id"], :name => "index_media_media_types_on_media_id_and_media_type_id", :unique => true

  create_table "media_people", :force => true do |t|
    t.integer "media_id",  :null => false
    t.integer "person_id", :null => false
  end

  add_index "media_people", ["media_id", "person_id"], :name => "index_media_people_on_media_id_and_person_id", :unique => true

  create_table "media_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "media_types", ["name"], :name => "index_media_types_on_name", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "slug",                         :null => false
    t.string   "title"
    t.text     "content"
    t.boolean  "published",  :default => true, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "people", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
