class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :identifier
      t.references :artist, foreign_key: true
      t.integer :cmc
      t.string :image_name
      t.integer :layout
      t.string :mana_cost
      t.string :name
      t.string :number
      t.string :power
      t.string :rarity
      t.text :text
      t.string :toughness
      t.string :type
      t.string :watermark
      t.string :flavor
      t.string :mci_number
      t.string :name
      t.string :border
      t.date :release_date
      t.integer :loyalty
      t.boolean :reserved
      t.integer :hand
      t.integer :life
      t.boolean :timeshifted
      t.boolean :starter

      t.timestamps
    end
  end
end
