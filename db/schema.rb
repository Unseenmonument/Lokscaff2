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

ActiveRecord::Schema.define(version: 20171117014848) do

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "rume_id"
    t.integer "convo_id"
    t.integer "comment_id"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "upvote_com"
    t.text "downvote_com"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "store_id"
    t.integer "product_id"
    t.integer "picture_id"
    t.integer "tottle_id"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.string "title"
    t.text "description"
    t.integer "likes"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "convo_id"
    t.integer "rume_id"
  end

  create_table "convos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rume_id"
    t.string "title"
    t.text "description"
    t.integer "likes"
    t.string "url"
    t.integer "convo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments"
    t.text "upvotes"
    t.text "downvotes"
  end

  create_table "products", force: :cascade do |t|
    t.integer "quantity"
    t.string "name"
    t.text "description"
    t.float "price"
    t.text "reviews"
    t.integer "user_id"
    t.integer "product_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "listeners"
    t.text "guidelines"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string "reputation_name"
    t.string "source_type"
    t.integer "source_id"
    t.string "target_type"
    t.integer "target_id"
    t.float "value", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name"
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type"
    t.index ["source_type", "source_id"], name: "index_rs_evaluations_on_source_type_and_source_id"
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type"
    t.index ["target_type", "target_id"], name: "index_rs_evaluations_on_target_type_and_target_id"
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.float "weight", default: 1.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id"
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type"
    t.index ["sender_type", "sender_id"], name: "index_rs_reputation_messages_on_sender_type_and_sender_id"
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string "reputation_name"
    t.float "value", default: 0.0
    t.string "aggregated_by"
    t.string "target_type"
    t.integer "target_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name"
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type"
    t.index ["target_type", "target_id"], name: "index_rs_reputations_on_target_type_and_target_id"
  end

  create_table "rumes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "guidelines"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator"
    t.text "listeners"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "products"
    t.text "location"
    t.integer "store_id"
    t.integer "user_id"
    t.string "email"
    t.string "phone_number"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tottles", force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.text "bio"
    t.string "location"
    t.text "listen_to"
    t.text "following"
    t.text "upvotes"
    t.text "downvotes"
    t.text "upvote_com"
    t.text "downvote_com"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
