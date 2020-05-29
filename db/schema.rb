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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_29_074234) do

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "richsitesummary_id"
    t.string "rss_id"
    t.text "title"
    t.text "url"
    t.string "author"
    t.text "summary"
    t.datetime "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["richsitesummary_id"], name: "index_articles_on_richsitesummary_id"
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "richsitesummary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["richsitesummary_id"], name: "index_follows_on_richsitesummary_id"
    t.index ["user_id", "richsitesummary_id"], name: "index_follows_on_user_id_and_richsitesummary_id", unique: true
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "richsitesummaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.text "rss_url"
    t.text "source_url"
    t.datetime "last_modified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "richsitesummaries"
  add_foreign_key "follows", "richsitesummaries"
  add_foreign_key "follows", "users"
end
