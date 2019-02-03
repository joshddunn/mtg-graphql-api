class CardColumnChanges < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :duel_deck, :string
    add_column :cards, :face_converted_mana_cost, :float
    add_column :cards, :frame_effect, :string
    add_column :cards, :frame_version, :string
    add_column :cards, :has_foil, :boolean
    add_column :cards, :has_non_foil, :boolean
    add_column :cards, :is_alternate, :boolean
    add_column :cards, :is_foil_only, :boolean
    add_column :cards, :is_online_only, :boolean
    add_column :cards, :is_reserved, :boolean
    add_column :cards, :is_timeshifted, :boolean
    add_column :cards, :is_oversized, :boolean
    add_column :cards, :legalities, :jsonb
    add_column :cards, :original_text, :string
    add_column :cards, :original_type, :string
    add_column :cards, :side, :string
    add_column :cards, :tcgplayer_product_id, :string

    rename_column :magic_sets, :tcg_player_group_id, :tcgplayer_group_id
    rename_column :cards, :border, :border_color
    rename_column :cards, :cmc, :converted_mana_cost
    rename_column :cards, :multiverseid, :multiverse_id
    rename_column :cards, :flavor, :flavor_text

    change_column :cards, :converted_mana_cost, :float
    change_column :cards, :hand, :string
    change_column :cards, :layout, :string
    change_column :cards, :life, :string
    change_column :cards, :loyalty, :string

    remove_column :cards, :reserved
    remove_column :cards, :mci_number
    remove_column :cards, :timeshifted
    remove_column :cards, :release_date
    remove_column :cards, :image_name
  end
end
