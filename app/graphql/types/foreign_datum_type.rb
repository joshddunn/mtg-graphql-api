Types::ForeignDatumType = GraphQL::ObjectType.define do
  name 'ForeignDatum'
  description 'Contains information about magic cards in other languages.'

  field :flavorText, types.String,
        'Returns the flavor text of the magic card.',
        property: :flavor_text

  field :text, types.String,
        'Returns the text of the magic card.',
        property: :text

  field :language, types.String,
        'Returns the language of the translation.',
        property: :language

  field :multiverseId, types.Int,
        'Returns the multiverse id of the magic card.',
        property: :multiverse_id

  field :name, types.String,
        'Returns the name of the magic card.',
        property: :name

  field :cardType, types.String,
        'Returns the type of the magic card.',
        property: :card_type
end
