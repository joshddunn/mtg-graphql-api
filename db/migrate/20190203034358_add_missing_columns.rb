class AddMissingColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :scryfall_id, :string
  end
end
