Types::MagicSetType = GraphQL::ObjectType.define do
  name 'MagicSet'
  description 'Contains information about a magic the gathering set.'

  field :name, types.String,
        'Returns the name of the magic set.',
        property: :name

  field :code, types.String,
        'Returns the code of the magic set.',
        property: :code_v3

  field :releaseDate, types.String,
        'Returns the release date of the magic set.',
        property: :release_date

  field :setType, types.String,
        'Returns the type of the magic set. E.g., ' \
        'starter, commander, core, etc.',
        property: :set_type

  field :isOnlineOnly, types.Boolean,
        'Returns whether the magic set was only released online.',
        property: :is_online_only

  field :isFoilOnly, types.Boolean,
        'Returns whether the magic set was only released online.',
        property: :is_foil_only

  field :block, Types::BlockType,
        'Returns information about the block the magic set is a part of.',
        property: :block

  field :booster, types[Types::BoosterType],
        'Returns the structure of a booster pack in this magic set.',
        property: :boosters

  field :baseSetSize, types.Int,
        'Returns base set size of the magic set.',
        property: :translations

  field :totalSetSize, types.String,
        'Returns the total set size of the magic set.',
        property: :total_set_size

  field :metaDate, types.String,
        'Returns the meta date property of the magic set.',
        property: :meta_date

  field :metaVersion, types.String,
        'Returns the meta version property of the magic set.',
        property: :meta_version

  field :mtgoCode, types.String,
        'Returns the mtgo code of the magic set.',
        property: :mtgo_code

  field :tcgplayerGroupId, types.String,
        'Returns the tcgplayer group id of the magic set.',
        property: :tcgplayer_group_id

  connection :cards, Types::CardConnectionType,
             'Returns paginated information about the cards in the magic set.',
             property: :cards

  connection :tokens, Types::TokenConnectionType,
             'Returns paginated information about the tokens in the magic set.',
             property: :tokens
end
