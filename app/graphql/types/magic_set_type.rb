# frozen_string_literal: true

Types::MagicSetType = GraphQL::ObjectType.define do
  name 'MagicSet'
  description 'Contains information about a magic the gathering set.'

  field :name, types.String,
        'Returns the name of the magic set.',
        property: :name

  field :code, types.String,
        'Returns the code of the magic set.',
        property: :code

  field :releaseDate, types.String,
        'Returns the release date of the magic set.',
        property: :release_date

  field :border, types.String,
        'Returns the border color of magic cards in the set. This field ' \
        'returns either null, silver, black, or white.',
        property: :border

  field :setType, types.String,
        'Returns the type of the magic set. E.g., ' \
        'starter, commander, core, etc.',
        property: :set_type

  field :mkmName, types.String,
        'Returns the MKM name of the magic set.',
        property: :mkm_name

  field :mkm_id, types.Int,
        'Returns the MKM id of the magic set.',
        property: :mkm_id

  field :magicCardsInfoCode, types.String,
        'Returns the magic cards info code of the magic set.',
        property: :magic_cards_info_code

  field :gathererCode, types.String,
        'Returns the gatherer code of the magic set.',
        property: :gatherer_code

  field :oldCode, types.String,
        'Returns the old code of the magic set.',
        property: :old_code

  field :onlineOnly, types.Boolean,
        'Returns whether the magic set was only released online.',
        property: :online_only

  field :block, Types::BlockType,
        'Returns information about the block the magic set is a part of.',
        property: :block

  field :alternativeNames, types[Types::AlternativeNameType],
        'Returns a list of alternative names for the magic set.',
        property: :alternative_names

  field :booster, types[Types::BoosterType],
        'Returns the structure of a booster pack in this magic set.',
        property: :boosters

  field :magicRaritiesCodes, types[Types::MagicRaritiesCodeType],
        'Returns a list of magic rarity codes for the magic set.',
        property: :magic_rarities_codes

  field :translations, types[Types::TranslationType],
        'Returns a list of translations for the name of the magic set.',
        property: :translations

  connection :cards, Types::CardConnectionType,
             'Returns paginated information about the cards in the magic set.',
             property: :cards
end
