# frozen_string_literal: true

Types::CardType = GraphQL::ObjectType.define do
  name 'Card'
  description 'Contains information about magic cards.'

  field :id, types.String,
        'Returns the id of the magic card. The id is a 40 ' \
        'character alphanumeric string.',
        property: :identifier

  field :multiverseid, types.Int,
        'Returns the multiverseid of the magic card.',
        property: :multiverseid

  field :artist, Types::ArtistType,
        'Returns information about the artist who illustrated the card.',
        property: :artist

  field :magicSet, Types::MagicSetType,
        'Returns information about the magic set this card is included in.',
        property: :magic_set

  field :cmc, types.Int,
        'Returns the converted mana cost of the magic card.',
        property: :cmc

  field :imageName, types.String,
        'Returns the image name of the magic card. This field is the name in ' \
        'lowercase.',
        property: :image_name

  field :layout, types.Int,
        'Returns the layout of the magic card.',
        property: :layout

  field :manaCost, types.String,
        'Returns the mana cost of the magic card.',
        property: :mana_cost

  field :name, types.String,
        'Returns the name as printed on the magic card.',
        property: :name

  field :number, types.String,
        'Returns the set number of the magic card.',
        property: :number

  field :power, types.String,
        'Returns the power of the magic card.',
        property: :power

  field :rarity, types.String,
        'Returns the rarity of the magic card.',
        property: :rarity

  field :text, types.String,
        'Returns the text inside of the rules box on the card.',
        property: :text

  field :toughness, types.String,
        'Returns the toughness of the magic card.',
        property: :toughness

  field :cardType, types.String,
        'Returns the card type as printed on the magic card. The card type ' \
        'includes the subtype, supertype, and type of the magic card.',
        property: :card_type

  field :watermark, types.String,
        'Returns the watermark on the magic card. If there is no watermark, ' \
        'this field returns null.',
        property: :watermark

  field :flavor, types.String,
        'Returns the flavour text printed on the magic card.',
        property: :flavor

  field :mciNumber, types.String,
        'Returns the MCI number of the magic card.',
        property: :mci_number

  field :border, types.String,
        'Returns the border color of the magic card. This field will return ' \
        'null, black, silver, or white.',
        property: :border

  field :releaseDate, types.String,
        'Returns the release date of the magic card. If this field is null, ' \
        'you should use the Magic Set release date as a fallback.',
        property: :release_date

  field :loyalty, types.Int,
        'Returns the loyalty value of the magic card.',
        property: :loyalty

  field :reserved, types.Boolean,
        'Returns whether the card is on the reserved list.',
        property: :reserved

  field :hand, types.Int,
        'Returns the maximum hand size modifier. This field returns null, ' \
        'except for Vanguard cards.',
        property: :hand

  field :life, types.Int,
        'Returns the starting life total modifier. This field returns null, ' \
        'except for Vanguard cards.',
        property: :life

  field :timeshifted, types.Boolean,
        'Returns whether the magic card is timeshifted.',
        property: :timeshifted

  field :starter, types.Boolean,
        'Returns whether the magic card was released in a core box set.',
        property: :starter

  field :colorIdentities, types[Types::ColorIdentityType],
        'Returns a list of color identities for the magic card.',
        property: :color_identities

  field :colors, types[Types::ColorType],
        'Returns a list of colors for the magic card.',
        property: :colors

  field :subtypes, types[Types::SubtypeType],
        'Returns a list of subtypes for the magic card.',
        property: :subtypes

  field :supertypes, types[Types::SupertypeType],
        'Returns a list of supertypes for the magic card.',
        property: :supertypes

  field :types, types[Types::TypeType],
        'Returns a list of types for the magic card.',
        property: :types

  field :variants, types[Types::CardType],
        'Returns a list of the variations of the magic card.',
        property: :variants
end
