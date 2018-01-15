Types::CardType = GraphQL::ObjectType.define do
  name "Card"
  description ""

  field :id, types.String, "", property: :identifier
  field :multiverseid, types.Int, "", property: :multiverseid
  field :artist, Types::ArtistType, "", property: :artist
  field :magicSet, Types::MagicSetType, "", property: :magic_set
  field :cmc, types.Int, "", property: :cmc
  field :imageName, types.String, "", property: :image_name
  field :layout, types.Int, "", property: :layout
  field :manaCost, types.String, "", property: :mana_cost
  field :name, types.String, "", property: :name
  field :number, types.String, "", property: :number
  field :power, types.String, "", property: :power
  field :rarity, types.String, "", property: :rarity
  field :text, types.String, "", property: :text
  field :toughness, types.String, "", property: :toughness
  field :cardType, types.String, "", property: :card_type
  field :watermark, types.String, "", property: :watermark
  field :flavor, types.String, "", property: :flavor
  field :mciNumber, types.String, "", property: :mci_number
  field :border, types.String, "", property: :border
  field :releaseDate, types.String, "", property: :release_date
  field :loyalty, types.Int, "", property: :loyalty
  field :reserved, types.Boolean, "", property: :reserved
  field :hand, types.Int, "", property: :hand
  field :life, types.Int, "", property: :life
  field :timeshifted, types.Boolean, "", property: :timeshifted
  field :starter, types.Boolean, "", property: :starter

  field :colorIdentities, types[Types::ColorIdentityType], "", property: :color_identities
  field :colors, types[Types::ColorType], "", property: :colors
  field :subtypes, types[Types::SubtypeType], "", property: :subtypes
  field :supertypes, types[Types::SupertypeType], "", property: :supertypes
  field :types, types[Types::TypeType], "", property: :types
  field :variants, types[Types::CardType], "", property: :variants
end
