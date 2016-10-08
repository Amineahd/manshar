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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161008225221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",                 default: "",    null: false
    t.string   "tagline",               default: "",    null: false
    t.text     "body",                  default: "",    null: false
    t.boolean  "published",             default: false, null: false
    t.integer  "user_id",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_uid"
    t.string   "cover_name"
    t.integer  "recommendations_count", default: 0
    t.integer  "comments_count",        default: 0
    t.float    "hotness",               default: 0.0
    t.datetime "published_at"
    t.integer  "reading_time"
    t.integer  "topic_id"
    t.string   "user_name"
    t.string   "topic_title"
    t.string   "category_color"
    t.integer  "category_id"
    t.text     "json_model"
    t.string   "user_avatar_url"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",                              null: false
    t.text     "description"
    t.string   "image_uid"
    t.string   "icon_uid"
    t.integer  "topics_count",   default: 0
    t.integer  "articles_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",          default: "#a7a7a7"
    t.string   "icon_cssclass",  default: "fa-tag"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "guid"
    t.text     "body",       null: false
    t.integer  "article_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.text     "caption",    default: "", null: false
    t.integer  "user_id",                 null: false
    t.string   "asset_uid",               null: false
    t.string   "asset_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.string   "url",        default: "", null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "pickabilities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pickable_id"
    t.string   "pickable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pickabilities", ["pickable_type", "pickable_id"], name: "index_pickabilities_on_pickable_type_and_pickable_id", using: :btree
  add_index "pickabilities", ["user_id", "pickable_type", "pickable_id"], name: "idx_user_pickabilities_on_pickabiility_id_and_type", unique: true, using: :btree
  add_index "pickabilities", ["user_id"], name: "index_pickabilities_on_user_id", using: :btree

  create_table "recommendations", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recommendations", ["user_id", "article_id"], name: "index_recommendations_on_user_id_and_article_id", unique: true, using: :btree

  create_table "thumbs", force: :cascade do |t|
    t.string   "signature"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",                      null: false
    t.integer  "articles_count", default: 0
    t.integer  "category_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "total_stats", force: :cascade do |t|
    t.integer "article_id",                        null: false
    t.integer "user_id"
    t.string  "article_title"
    t.integer "page_views_count",      default: 0
    t.integer "reads_count",           default: 0
    t.integer "comments_count",        default: 0
    t.integer "recommendations_count", default: 0
    t.integer "facebook_shares_count", default: 0
    t.integer "twitter_shares_count",  default: 0
    t.integer "plus_shares_count",     default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                     default: "", null: false
    t.string   "bio",                      default: ""
    t.string   "avatar_uid"
    t.string   "avatar_name"
    t.integer  "recommendations_count",    default: 0
    t.integer  "comments_count",           default: 0
    t.integer  "published_articles_count", default: 0
    t.string   "provider"
    t.string   "uid",                      default: "", null: false
    t.text     "tokens"
    t.string   "nickname"
    t.integer  "role",                     default: 1
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "pickabilities", "users"
end
