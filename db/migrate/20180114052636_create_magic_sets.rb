class CreateMagicSets < ActiveRecord::Migration[5.1]
  def change
    create_table :magic_sets do |t|
      t.string :name
      t.string :code
      t.date :release_date
      t.string :border
      t.string :set_type
      t.string :mkm_name
      t.integer :mkm_id
      t.string :magic_cards_info_code
      t.string :gatherer_code
      t.string :old_code
      t.boolean :online_only
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
