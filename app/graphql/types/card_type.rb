Types::CardType = GraphQL::ObjectType.define do
  name "Card"
  description "Card information."

  field :id, types.String, "", property: :identifier
  field :multiverseid, types.Int, "", property: :multiverseid
  field :artist, Types::ArtistType, "Artist information.", property: :artist
  field :magicSet, Types::MagicSetType, "The Magic set this card belongs to.", property: :magic_set
  field :cmc, types.Int, "Converted mana cost", property: :cmc
  field :imageName, types.String, "", property: :image_name
  field :layout, types.Int, "", property: :layout
  field :manaCost, types.String, "", property: :mana_cost
  field :name, types.String, "The name of the card.", property: :name
  field :number, types.String, "The number of the card within a set.", property: :number
  field :power, types.String, "", property: :power
  field :rarity, types.String, "", property: :rarity
  field :text, types.String, "Card rules text.", property: :text
  field :toughness, types.String, "", property: :toughness
  field :cardType, types.String, "The full card type as written. Includes subtype, supertype, and type.", property: :card_type
  field :watermark, types.String, "", property: :watermark
  field :flavor, types.String, "Flavor text for the card.", property: :flavor
  field :mciNumber, types.String, "", property: :mci_number
  field :border, types.String, "The border of the card. Return values are null, black, silver, white", property: :border
  field :releaseDate, types.String, "Doesn't exist for all cards. Use Magic Set release date as a fallback.", property: :release_date
  field :loyalty, types.Int, "", property: :loyalty
  field :reserved, types.Boolean, "Returns whether the card is on the reserved list.", property: :reserved
  field :hand, types.Int, "", property: :hand
  field :life, types.Int, "", property: :life
  field :timeshifted, types.Boolean, "Returns whether the card is timeshifted.", property: :timeshifted
  field :starter, types.Boolean, "", property: :starter

  field :colorIdentities, types[Types::ColorIdentityType], "Returns a list of the card's color identities.", property: :color_identities
  field :colors, types[Types::ColorType], "Returns a list of the card's colors.", property: :colors
  field :subtypes, types[Types::SubtypeType], "Returns a list of the card's subtypes.", property: :subtypes
  field :supertypes, types[Types::SupertypeType], "Returns a list of the card's supertypes.", property: :supertypes
  field :types, types[Types::TypeType], "Returns a list of the card's types.", property: :types
  field :variants, types[Types::CardType], "Returns a list of card variants.", property: :variants
end
