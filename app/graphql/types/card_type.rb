# frozen_string_literal: true

Types::CardType = GraphQL::ObjectType.define do
  name 'Card'
  description 'Contains information about magic cards.'

  field :id, types.String,
        'Returns the id of the magic card. The id is a 40 ' \
        'character alphanumeric string.',
        property: :identifier

  field :multiverseId, types.Int,
        'Returns the multiverse id of the magic card.',
        property: :multiverse_id

  field :artist, Types::ArtistType,
        'Returns information about the artist who illustrated the card.',
        property: :artist

  field :magicSet, Types::MagicSetType,
        'Returns information about the magic set this card is included in.',
        property: :magic_set

  field :convertedManaCost, types.Int,
        'Returns the converted mana cost of the magic card.',
        property: :converted_mana_cost

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

  field :flavorText, types.String,
        'Returns the flavour text printed on the magic card.',
        property: :flavor_text

  field :borderColor, types.String,
        'Returns the border color of the magic card. This field will return ' \
        'null, black, silver, or white.',
        property: :border_color

  field :loyalty, types.Int,
        'Returns the loyalty value of the magic card.',
        property: :loyalty

  field :hand, types.Int,
        'Returns the maximum hand size modifier. This field returns null, ' \
        'except for Vanguard cards.',
        property: :hand

  field :life, types.Int,
        'Returns the starting life total modifier. This field returns null, ' \
        'except for Vanguard cards.',
        property: :life

  field :starter, types.Boolean,
        'Returns whether the magic card was released in a core box set.',
        property: :starter

  field :duelDeck, types.String,
        'Returns the name of the duel deck it is released in.',
        property: :duel_deck

  field :faceConvertedManaCost, types.Float,
        'Returns the face converted mana cost of the card.',
        property: :face_converted_mana_cost

  field :frameEffect, types.String,
        'Returns the frame effect of the card.',
        property: :frame_effect

  field :frameVersion, types.String,
        'Returns the frame version of the card.',
        property: :frame_version

  field :hasFoil, types.Boolean,
        'Returns whether the card has a foil version.',
        property: :has_foil

  field :hasNonFoil, types.Boolean,
        'Returns whether the card has a non-foil version.',
        property: :has_non_foil

  field :isAlternate, types.Boolean,
        'Returns whether the card is an alternate version.',
        property: :is_alternate

  field :isFoilOnly, types.Boolean,
        'Returns whether the card is only printed in foil.',
        property: :is_foil_only

  field :isOnlineOnly, types.Boolean,
        'Returns whether the card is only available online.',
        property: :is_online_only

  field :isReserved, types.Boolean,
        'Returns whether the card is on the reserved list.',
        property: :is_reserved

  field :isTimeshifted, types.Boolean,
        'Returns whether the card is timeshifted.',
        property: :is_timeshifted

  field :isOversized, types.Boolean,
        'Returns whether the card is oversized.',
        property: :is_oversized

  field :legalities, Scalars::Json,
        'Returns the legality of the card in various formats.',
        property: :legalities

  field :originalText, types.String,
        'Returns the original text on the card.',
        property: :original_text

  field :originalType, types.String,
        'Returns the original type on the card.',
        property: :original_type

  field :side, types.String,
        'If printed in a duel deck, returns the side of the duel deck its printed in.',
        property: :side

  field :tcgplayerProductId, types.String,
        'Returns the tcgplayer product id of the card',
        property: :tcgplayer_product_id

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
