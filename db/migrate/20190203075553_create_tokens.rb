class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.references :artist, foreign_key: true
      t.references :magic_set, foreign_key: true
      t.string :border_color
      t.boolean :is_online_only
      t.string :loyalty
      t.string :name
      t.string :number
      t.string :power
      t.string :scryfall_id
      t.string :side
      t.string :text
      t.string :toughness
      t.string :token_type
      t.string :identifier
      t.string :watermark

      t.timestamps
    end

    add_index :tokens, :identifier
  end
end
