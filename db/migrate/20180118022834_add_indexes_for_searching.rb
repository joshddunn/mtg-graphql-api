class AddIndexesForSearching < ActiveRecord::Migration[5.1]
  def change
    add_index :artists, :identifier
    add_index :blocks, :identifier
    add_index :card_descriptions, :identifier
    add_index :subtypes, :identifier
    add_index :supertypes, :identifier
    add_index :types, :identifier
  end
end
