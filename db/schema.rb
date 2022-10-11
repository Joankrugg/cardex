# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_11_123539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "anglophone_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
  end

  create_table "brindos_customers", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "booking_method"
    t.string "address"
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.datetime "brindos_spa_first_visit"
    t.datetime "brindos_spa_last_visit"
    t.datetime "brindos_restaurant_first_visit"
    t.datetime "brindos_restaurant_last_visit"
  end

  create_table "brindos_pro_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "position"
    t.string "firm"
    t.string "language"
    t.string "activity"
    t.string "note"
    t.string "state"
    t.bigint "sector_id"
    t.bigint "creator_id"
    t.bigint "type_id"
    t.bigint "home_id"
    t.index ["creator_id"], name: "index_brindos_pro_customers_on_creator_id"
    t.index ["home_id"], name: "index_brindos_pro_customers_on_home_id"
    t.index ["sector_id"], name: "index_brindos_pro_customers_on_sector_id"
    t.index ["type_id"], name: "index_brindos_pro_customers_on_type_id"
  end

  create_table "brindos_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "brindos_restaurant_last_visit"
    t.datetime "brindos_restaurant_first_visit"
  end

  create_table "brindos_room_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "first_visit"
    t.datetime "last_visit"
  end

  create_table "brindos_spa_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "brindos_spa_first_visit"
    t.datetime "brindos_spa_last_visit"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "manager"
    t.string "status"
    t.integer "terms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "surname"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_lists", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_visit"
    t.string "note"
    t.integer "people"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sector_id"
    t.bigint "creator_id"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "surname"
    t.string "position"
    t.string "phone"
    t.string "genre"
    t.bigint "type_id"
    t.string "firm"
    t.datetime "birth"
    t.string "language"
    t.bigint "home_id"
    t.string "note"
    t.string "state"
    t.string "activity"
    t.index ["creator_id"], name: "index_customers_on_creator_id"
    t.index ["home_id"], name: "index_customers_on_home_id"
    t.index ["sector_id"], name: "index_customers_on_sector_id"
    t.index ["type_id"], name: "index_customers_on_type_id"
  end

  create_table "francophone_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
  end

  create_table "ghso_spa_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.string "activity"
    t.datetime "megeve_spa_first_visit"
    t.datetime "megeve_spa_last_visit"
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leognan_customers", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.datetime "leognan_restaurant_first_visit"
    t.datetime "leognan_restaurant_last_visit"
  end

  create_table "leognan_pro_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "position"
    t.string "firm"
    t.string "language"
    t.string "activity"
    t.string "note"
    t.string "state"
    t.bigint "sector_id"
    t.bigint "creator_id"
    t.bigint "type_id"
    t.bigint "home_id"
    t.index ["creator_id"], name: "index_leognan_pro_customers_on_creator_id"
    t.index ["home_id"], name: "index_leognan_pro_customers_on_home_id"
    t.index ["sector_id"], name: "index_leognan_pro_customers_on_sector_id"
    t.index ["type_id"], name: "index_leognan_pro_customers_on_type_id"
  end

  create_table "leognan_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "leognan_restaurant_first_visit"
    t.datetime "leognan_restaurant_last_visit"
  end

  create_table "mail_addresses", force: :cascade do |t|
    t.string "email"
    t.string "status"
    t.string "blocked"
    t.string "hard_bounce"
    t.string "soft_bounce"
    t.string "retrying"
    t.string "open"
    t.string "click"
    t.string "unsub"
    t.string "spam"
    t.string "reason"
    t.string "date"
    t.string "messageid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mail_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.datetime "send_date"
    t.text "text"
    t.string "goal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mail_orders_on_user_id"
  end

  create_table "megeve_customers", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.datetime "megeve_restaurant_first_visit"
    t.datetime "megeve_restaurant_last_visit"
    t.datetime "megeve_spa_first_visit"
    t.datetime "megeve_spa_last_visit"
  end

  create_table "megeve_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "megeve_restaurant_first_visit"
    t.datetime "megeve_restaurant_last_visit"
  end

  create_table "megeve_room_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "first_visit"
    t.datetime "last_visit"
  end

  create_table "millesime_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "home"
    t.string "address"
    t.boolean "unsubscribe", default: false
  end

  create_table "msociety_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "porto_customers", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
  end

  create_table "porto_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "porto_room_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "first_visit"
    t.datetime "last_visit"
  end

  create_table "quotations", force: :cascade do |t|
    t.string "firm"
    t.string "zipcode"
    t.string "surname"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "purpose"
    t.string "rooming_place"
    t.string "fooding_place"
    t.integer "people"
    t.datetime "demand_date"
    t.date "event_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_quotations_on_creator_id"
  end

  create_table "raba_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.datetime "raba_restaurant_first_visit"
    t.datetime "raba_restaurant_last_visit"
    t.datetime "raba_spa_first_visit"
    t.datetime "raba_spa_last_visit"
  end

  create_table "raba_pro_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "position"
    t.string "firm"
    t.string "language"
    t.string "activity"
    t.string "note"
    t.string "state"
    t.bigint "sector_id"
    t.bigint "creator_id"
    t.bigint "type_id"
    t.bigint "home_id"
    t.index ["creator_id"], name: "index_raba_pro_customers_on_creator_id"
    t.index ["home_id"], name: "index_raba_pro_customers_on_home_id"
    t.index ["sector_id"], name: "index_raba_pro_customers_on_sector_id"
    t.index ["type_id"], name: "index_raba_pro_customers_on_type_id"
  end

  create_table "raba_pros", force: :cascade do |t|
    t.string "genre"
    t.string "firm"
    t.string "zipcode"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "raba_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "raba_restaurant_first_visit"
    t.datetime "raba_restaurant_last_visit"
  end

  create_table "raba_room_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "first_visit"
    t.datetime "last_visit"
  end

  create_table "raba_spa_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.string "activity"
    t.datetime "raba_spa_first_visit"
    t.datetime "raba_spa_last_visit"
  end

  create_table "sacy_customers", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.datetime "sacy_restaurant_first_visit"
    t.datetime "sacy_restaurant_last_visit"
    t.datetime "sacy_spa_first_visit"
    t.datetime "sacy_spa_last_visit"
  end

  create_table "sacy_pro_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "position"
    t.string "firm"
    t.string "language"
    t.string "activity"
    t.string "note"
    t.string "state"
    t.bigint "sector_id"
    t.bigint "creator_id"
    t.bigint "type_id"
    t.bigint "home_id"
    t.index ["creator_id"], name: "index_sacy_pro_customers_on_creator_id"
    t.index ["home_id"], name: "index_sacy_pro_customers_on_home_id"
    t.index ["sector_id"], name: "index_sacy_pro_customers_on_sector_id"
    t.index ["type_id"], name: "index_sacy_pro_customers_on_type_id"
  end

  create_table "sacy_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "sacy_restaurant_first_visit"
    t.datetime "sacy_restaurant_last_visit"
  end

  create_table "sacy_room_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.datetime "first_visit"
    t.datetime "last_visit"
  end

  create_table "sacy_spa_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.boolean "unsubscribe", default: false
    t.string "activity"
    t.datetime "sacy_spa_first_visit"
    t.datetime "sacy_spa_last_visit"
  end

  create_table "sales_reviews", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "position"
    t.string "phone"
    t.string "firm"
    t.string "language"
    t.string "note"
    t.string "state"
    t.string "activity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sector_id"
    t.bigint "creator_id"
    t.bigint "type_id"
    t.bigint "home_id"
    t.datetime "birth"
    t.index ["creator_id"], name: "index_sales_reviews_on_creator_id"
    t.index ["home_id"], name: "index_sales_reviews_on_home_id"
    t.index ["sector_id"], name: "index_sales_reviews_on_sector_id"
    t.index ["type_id"], name: "index_sales_reviews_on_type_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "theoule_beach_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "theoule_beach_first_visit"
    t.datetime "theoule_beach_last_visit"
  end

  create_table "theoule_customers", force: :cascade do |t|
    t.string "genre"
    t.string "name"
    t.string "surname"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "birth"
    t.string "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unsubscribe", default: false
    t.datetime "first_visit"
    t.datetime "last_visit"
    t.datetime "theoule_restaurant_first_visit"
    t.datetime "theoule_restaurant_last_visit"
    t.datetime "theoule_spa_first_visit"
    t.datetime "theoule_spa_last_visit"
    t.datetime "theoule_beach_first_visit"
    t.datetime "theoule_beach_last_visit"
    t.string "language"
  end

  create_table "theoule_restaurant_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "theoule_restaurant_first_visit"
    t.datetime "theoule_restaurant_last_visit"
    t.string "language"
  end

  create_table "theoule_spa_customers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.string "genre"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "birth"
    t.string "segment"
    t.string "home"
    t.boolean "unsubscribe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "theoule_spa_first_visit"
    t.datetime "theoule_spa_last_visit"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "marketing", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "brindos_pro_customers", "creators"
  add_foreign_key "brindos_pro_customers", "homes"
  add_foreign_key "brindos_pro_customers", "sectors"
  add_foreign_key "brindos_pro_customers", "types"
  add_foreign_key "customers", "creators"
  add_foreign_key "customers", "homes"
  add_foreign_key "customers", "sectors"
  add_foreign_key "customers", "types"
  add_foreign_key "leognan_pro_customers", "creators"
  add_foreign_key "leognan_pro_customers", "homes"
  add_foreign_key "leognan_pro_customers", "sectors"
  add_foreign_key "leognan_pro_customers", "types"
  add_foreign_key "quotations", "creators"
  add_foreign_key "raba_pro_customers", "creators"
  add_foreign_key "raba_pro_customers", "homes"
  add_foreign_key "raba_pro_customers", "sectors"
  add_foreign_key "raba_pro_customers", "types"
  add_foreign_key "sacy_pro_customers", "creators"
  add_foreign_key "sacy_pro_customers", "homes"
  add_foreign_key "sacy_pro_customers", "sectors"
  add_foreign_key "sacy_pro_customers", "types"
  add_foreign_key "sales_reviews", "creators"
  add_foreign_key "sales_reviews", "homes"
  add_foreign_key "sales_reviews", "sectors"
  add_foreign_key "sales_reviews", "types"
end
