class AddIndexesForSeeds < ActiveRecord::Migration[5.2]
  def change
    add_index :card_descriptions, :identifier unless index_exists? :card_descriptions, :identifier
    add_index :artists, :identifier unless index_exists? :artists, :identifier
    add_index :color_identities, :identifier unless index_exists? :color_identities, :identifier
    add_index :colors, :identifier unless index_exists? :colors, :identifier
    add_index :subtypes, :identifier unless index_exists? :subtypes, :identifier
    add_index :supertypes, :identifier unless index_exists? :supertypes, :identifier
    add_index :types, :identifier unless index_exists? :types, :identifier
    add_index :cards, :identifier unless index_exists? :cards, :identifier
  end
end
