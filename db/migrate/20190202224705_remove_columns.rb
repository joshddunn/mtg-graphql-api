class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :magic_sets, :base_set_size, :integer
    add_column :magic_sets, :code_v3, :string
    add_column :magic_sets, :is_foil_only, :boolean
    add_column :magic_sets, :meta_date, :date
    add_column :magic_sets, :meta_version, :string
    add_column :magic_sets, :mtgo_code, :string
    add_column :magic_sets, :tcg_player_group_id, :integer
    add_column :magic_sets, :total_set_size, :integer

    remove_column :magic_sets, :border
    remove_column :magic_sets, :old_code
    remove_column :magic_sets, :gatherer_code
    remove_column :magic_sets, :magic_cards_info_code
    remove_column :magic_sets, :mkm_id
    remove_column :magic_sets, :mkm_name

    rename_column :magic_sets, :online_only, :is_online_only
  end
end
