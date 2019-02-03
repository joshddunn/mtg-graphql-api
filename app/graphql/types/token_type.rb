Types::TokenType = GraphQL::ObjectType.define do
  name 'Token'
  description 'Contains information about magic token.'

  field :id, types.String,
        'Returns the id of the magic token. The id is a 40 ' \
        'character alphanumeric string.',
        property: :identifier

  field :artist, Types::ArtistType,
        'Returns information about the artist who illustrated the token.',
        property: :artist

  field :magicSet, Types::MagicSetType,
        'Returns information about the magic set this token is included in.',
        property: :magic_set

  field :name, types.String,
        'Returns the name as printed on the magic token.',
        property: :name

  field :number, types.String,
        'Returns the set number of the magic token.',
        property: :number

  field :power, types.String,
        'Returns the power of the magic token.',
        property: :power

  field :text, types.String,
        'Returns the text inside of the rules box on the token.',
        property: :text

  field :toughness, types.String,
        'Returns the toughness of the magic token.',
        property: :toughness

  field :tokenType, types.String,
        'Returns the token type as printed on the magic token. The token type ' \
        'includes the subtype, supertype, and type of the magic token.',
        property: :token_type

  field :watermark, types.String,
        'Returns the watermark on the magic token. If there is no watermark, ' \
        'this field returns null.',
        property: :watermark

  field :borderColor, types.String,
        'Returns the border color of the magic token. This field will return ' \
        'null, black, silver, or white.',
        property: :border_color

  field :loyalty, types.Int,
        'Returns the loyalty value of the magic token.',
        property: :loyalty

  field :isOnlineOnly, types.Boolean,
        'Returns whether the token is only available online.',
        property: :is_online_only

  field :side, types.String,
        'If printed in a duel deck, returns the side of the duel deck its printed in.',
        property: :side

  field :scryfallId, types.String,
        'Returns the scryfall id of the token',
        property: :scryfall_id

  field :colorIndicators, types[Types::ColorType],
        'Returns a list of color indicators for the magic token.',
        property: :color_indicators

  field :colorIdentities, types[Types::ColorType],
        'Returns a list of color identities for the magic token.',
        property: :color_identities

  field :colors, types[Types::ColorType],
        'Returns a list of colors for the magic token.',
        property: :colors

  field :cards, types[Types::CardType],
        'Returns a list of cards that reference this token.',
        property: :cards
end
