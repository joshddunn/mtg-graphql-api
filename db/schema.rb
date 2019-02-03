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

ActiveRecord::Schema.define(version: 2019_02_03_032704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternative_names", force: :cascade do |t|
    t.bigint "magic_set_id"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_alternative_names_on_identifier"
    t.index ["magic_set_id"], name: "index_alternative_names_on_magic_set_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_artists_on_identifier"
  end

  create_table "blocks", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_blocks_on_identifier"
  end

  create_table "boosters", force: :cascade do |t|
    t.bigint "magic_set_id"
    t.integer "position"
    t.bigint "card_description_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_description_id"], name: "index_boosters_on_card_description_id"
    t.index ["magic_set_id"], name: "index_boosters_on_magic_set_id"
  end

  create_table "card_descriptions", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_card_descriptions_on_identifier"
  end

  create_table "cards", force: :cascade do |t|
    t.string "identifier"
    t.integer "multiverse_id"
    t.bigint "artist_id"
    t.bigint "magic_set_id"
    t.float "converted_mana_cost"
    t.string "layout"
    t.string "mana_cost"
    t.string "name"
    t.string "number"
    t.string "power"
    t.string "rarity"
    t.text "text"
    t.string "toughness"
    t.string "card_type"
    t.string "watermark"
    t.string "flavor_text"
    t.string "border_color"
    t.string "loyalty"
    t.string "hand"
    t.string "life"
    t.boolean "starter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duel_deck"
    t.float "face_converted_mana_cost"
    t.string "frame_effect"
    t.string "frame_version"
    t.boolean "has_foil"
    t.boolean "has_non_foil"
    t.boolean "is_alternate"
    t.boolean "is_foil_only"
    t.boolean "is_online_only"
    t.boolean "is_reserved"
    t.boolean "is_timeshifted"
    t.boolean "is_oversized"
    t.jsonb "legalities"
    t.string "original_text"
    t.string "original_type"
    t.string "side"
    t.string "tcgplayer_product_id"
    t.index ["artist_id"], name: "index_cards_on_artist_id"
    t.index ["identifier"], name: "index_cards_on_identifier"
    t.index ["magic_set_id"], name: "index_cards_on_magic_set_id"
  end

  create_table "color_associations", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_color_associations_on_card_id"
    t.index ["color_id"], name: "index_color_associations_on_color_id"
  end

  create_table "color_identities", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_color_identities_on_identifier"
  end

  create_table "color_identity_associations", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "color_identity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_color_identity_associations_on_card_id"
    t.index ["color_identity_id"], name: "index_color_identity_associations_on_color_identity_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_colors_on_identifier"
  end

  create_table "magic_rarities_codes", force: :cascade do |t|
    t.bigint "magic_set_id"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["magic_set_id"], name: "index_magic_rarities_codes_on_magic_set_id"
  end

  create_table "magic_sets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.date "release_date"
    t.string "set_type"
    t.boolean "is_online_only"
    t.bigint "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "base_set_size"
    t.string "code_v3"
    t.boolean "is_foil_only"
    t.date "meta_date"
    t.string "meta_version"
    t.string "mtgo_code"
    t.integer "tcgplayer_group_id"
    t.integer "total_set_size"
    t.index ["block_id"], name: "index_magic_sets_on_block_id"
  end

  create_table "subtype_associations", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "subtype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_subtype_associations_on_card_id"
    t.index ["subtype_id"], name: "index_subtype_associations_on_subtype_id"
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_subtypes_on_identifier"
  end

  create_table "supertype_associations", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "supertype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_supertype_associations_on_card_id"
    t.index ["supertype_id"], name: "index_supertype_associations_on_supertype_id"
  end

  create_table "supertypes", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_supertypes_on_identifier"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "magic_set_id"
    t.string "code"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["magic_set_id"], name: "index_translations_on_magic_set_id"
  end

  create_table "type_associations", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_type_associations_on_card_id"
    t.index ["type_id"], name: "index_type_associations_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_types_on_identifier"
  end

  create_table "variations", force: :cascade do |t|
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variation_id"
    t.index ["card_id"], name: "index_variations_on_card_id"
    t.index ["variation_id"], name: "index_variations_on_variation_id"
  end

  add_foreign_key "alternative_names", "magic_sets"
  add_foreign_key "boosters", "card_descriptions"
  add_foreign_key "boosters", "magic_sets"
  add_foreign_key "cards", "artists"
  add_foreign_key "cards", "magic_sets"
  add_foreign_key "color_associations", "cards"
  add_foreign_key "color_associations", "colors"
  add_foreign_key "color_identity_associations", "cards"
  add_foreign_key "color_identity_associations", "color_identities"
  add_foreign_key "magic_rarities_codes", "magic_sets"
  add_foreign_key "magic_sets", "blocks"
  add_foreign_key "subtype_associations", "cards"
  add_foreign_key "subtype_associations", "subtypes"
  add_foreign_key "supertype_associations", "cards"
  add_foreign_key "supertype_associations", "supertypes"
  add_foreign_key "translations", "magic_sets"
  add_foreign_key "type_associations", "cards"
  add_foreign_key "type_associations", "types"
  add_foreign_key "variations", "cards"
  add_foreign_key "variations", "cards", column: "variation_id"
end
